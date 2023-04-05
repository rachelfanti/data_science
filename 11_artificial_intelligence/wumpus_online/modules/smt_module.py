import enum

from torch import solve
from z3 import *
from wumpus import Hunter

class Model(enum.Enum):
    WUMPUS = 'w'
    PIT = 'p'

class SMT_module(object):
    def compute_models(self, game_env):
        if game_env.size_known: world_locs = [(i, j) for j in range(game_env.world_size[1]) for i in range(game_env.world_size[0])]
        else: world_locs = [(i, j) for j in range(game_env.world_size[1]+1) for i in range(game_env.world_size[0]+1)]

        pits_locs = set()
        wumpus_locs = set()

        if game_env.breeze_locs: pits_locs = self.compute_model(Model.PIT, game_env, world_locs)
        if game_env.stench_locs: 
            wumpus_locs = self.compute_model(Model.WUMPUS, game_env, world_locs)

            # Make sure that all wumpus candidates are neighboring all the found stench locations
            for wumpus_candidate in wumpus_locs.copy():
                stench_neighbors = list(filter(lambda neighbor: (
                    neighbor in game_env.stench_locs
                ), [tuple(map(sum,zip(wumpus_candidate, direction.value))) for direction in Hunter.Orientation]))
                
                if set(stench_neighbors) != set(game_env.stench_locs): wumpus_locs.remove(wumpus_candidate)

        return list(pits_locs), list(wumpus_locs)

    def compute_model(self, model, game_env, world_locs):
        for i, j in world_locs: exec(f'{model._value_}{i}{j} = Int(\'{model._value_}{i}{j}\')')

        s = Solver()

        solver_cond = 's.add('
        unexplored_locs = []

        # A location is either free (0) or not (1)
        # Already explored locations are surely free
        for i,j in world_locs: 
            curr_loc = (i, j)

            if(
                curr_loc in game_env.free_locs or
                curr_loc in game_env.breeze_locs or
                curr_loc in game_env.stench_locs 
            ): solver_cond += f'({model._value_}{i}{j} == 0),'
            else: unexplored_locs.append(curr_loc)

        # Set unexplored locations with all adjacent explored tiles with stench/breeze as potentially occupied
        for i,j in unexplored_locs:   
            explored_neighbors = list(filter(lambda neighbor: (
                    neighbor in game_env.free_locs or
                    neighbor in game_env.breeze_locs or
                    neighbor in game_env.stench_locs
                ), [tuple(map(sum,zip((i,j), direction.value))) for direction in Hunter.Orientation]))
            
            if(
                explored_neighbors and # At least one explored neighbor
                (
                    (
                        model == Model.WUMPUS and
                        all(target_loc in game_env.stench_locs for target_loc in explored_neighbors)
                    ) or
                    (
                        model == Model.PIT and
                        all(target_loc in game_env.breeze_locs for target_loc in explored_neighbors)
                    )
                )
            ): 
                solver_cond += f'Or({model._value_}{i}{j} == 0, {model._value_}{i}{j} == 1),'
            else: 
                solver_cond += f'({model._value_}{i}{j} == 0),'

        if model == Model.WUMPUS: # Wumpus specific logic
            # Only one wumpus per game
            solver_cond += '('
            for i,j in world_locs: solver_cond += f'{model._value_}{i}{j} +'
            solver_cond = solver_cond[:-1]
            solver_cond += '== 1),'

            # Iterate through stench tiles and set the sum of (unexplored) neighbors as 1
            for i,j in game_env.stench_locs:
                unexpl_neighbors = list(filter(lambda target_loc: target_loc in unexplored_locs, [tuple(map(sum,zip((i,j), direction.value))) for direction in Hunter.Orientation]))

                if len(unexpl_neighbors) > 1:
                    solver_cond += '('
                    solver_cond += ' + '.join([model._value_ + str(i[0]) + str(i[1]) for i in unexpl_neighbors])
                    solver_cond += '== 1),'
        else: # Pit specific logic
            # Iterate through breeze tiles and set upper/lower bounds for pit neighbors
            # At least one neighbor must be a pit, at most all unexplored neighbors are pits
            for i,j in game_env.breeze_locs:
                unexpl_neighbors = list(filter(lambda target_loc: target_loc in unexplored_locs, [tuple(map(sum,zip((i,j), direction.value))) for direction in Hunter.Orientation]))
                
                if unexpl_neighbors:
                    solver_cond += 'And('
                    targets_str = ' + '.join([model._value_ + str(i[0]) + str(i[1]) for i in unexpl_neighbors])
                    solver_cond += f'({targets_str}) >= 1,'
                    solver_cond += f'({targets_str}) <= {len(unexpl_neighbors)}'
                    solver_cond += '),'

        if solver_cond[-1] == ',': solver_cond = solver_cond[:-1]

        exec(solver_cond + ')')

        occupied_locs = set() # Potentially occupied locations
        while s.check() == sat:
            m = s.model()
            occupied_locs = occupied_locs | set([(int(str(d)[1]), int(str(d)[2])) for d in m if m[d] == 1])
            s.add(Or([d() != m[d] for d in m]))

        return occupied_locs