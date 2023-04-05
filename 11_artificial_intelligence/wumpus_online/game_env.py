import enum

from wumpus import Hunter, Percept
from modules.a_star_module import AStar
from modules.smt_module import SMT_module
from modules.bayesian_module import Bayesian_module, Model

class Percept(enum.Enum):
    STENCH = 'Stench'
    BREEZE = 'Breeze'
    BUMP = 'Bump'
    SCREAM = 'Scream'
    GLITTER = 'Glitter'

class GameEnvironment(object):
    '''
    Models the game environment based on the most current information obtained by the agent.
    '''
    START_LOC = (0, 0)

    def __init__(self, truth_threshold = 0.8):
        self.agent_loc = self.START_LOC
        self.agent_orientation = Hunter.Orientation.N
        self.arrow_used = False

        self.world_size = (1, 1)
        self.size_known = False

        self.kill_loc = None
        self.ready_to_shoot = False

        self.head_out = False

        self.curr_percepts = None
        self.pending_locs = set() # Pending to be explored
        self.free_locs = set()
        self.stench_locs = set()
        self.breeze_locs = set()

        # SMT results
        self.wumpus_locs = []
        self.pits_locs = []

        self.action_list = [] # List of actions to be passed to the online player

        # Value between 0 and 1 determining when the probability of a tile being a pit/wumpus location is accepted as truth from the agent
        self.truth_threshold = truth_threshold

    def get_action(self, percepts):
        '''
        Get the subsequent action to be performed by the agent.
        If the action list is empty, a new set of actions is computed.
        '''
        self.update_env(percepts)

        if not self.action_list: 
            self.action_list = self.build_action_list()

        if self.action_list: 
            curr_action = self.action_list.pop(0)
            self.execute_action(curr_action)
            return curr_action
        else: return None

    def update_env(self, percepts):
        '''
        Calls the necessary methods to update the game environment variables based on the most current user position
        '''
        new_loc = self.update_tile_lists(percepts)

        # Remove current loc from the ones pending to be explored
        if self.agent_loc in self.pending_locs: self.pending_locs.remove(self.agent_loc) 

        size_updated = self.update_world_size()
        
        # Update the SMT models if a new stench/breeze tile is discovered or if the known world size has increased
        if new_loc or size_updated: self.pits_locs, self.wumpus_locs = SMT_module().compute_models(self)

    def build_action_list(self):
        '''
        Uses current percept and stored information about the world to compute the appropriate way to populate the action list
        '''
        self.update_pending_locs()
        ret = []

        if Percept.GLITTER._value_ in self.curr_percepts: 
            ret.append(Hunter.Actions.GRAB)
            self.head_out = True
        if self.head_out: return ret + AStar(self).run_AStar() + [Hunter.Actions.CLIMB]
        if self.pending_locs:  # Initial environment exploration
            viable_dirs, unexplored_targets = self.get_viable_directions()
            if unexplored_targets: # Prioritize adjacent unexplored neighbors
                if self.agent_orientation in viable_dirs: return self.execute_direction(self.agent_orientation) # Prioritize already faced direction (if possible)
                else: return self.execute_direction(viable_dirs[0])
            else: # Head towards closest pending location
                pending_paths = list(filter(lambda path: path, [AStar(self, pending_loc).run_AStar() for pending_loc in self.pending_locs]))
                if pending_paths:
                    shortest_path = min(pending_paths, key=len) 
                    return shortest_path
        if not self.arrow_used and self.stench_locs: return self.attempt_kill() # Kill attempt if initial exploration is done

        return ret

    def update_pending_locs(self):
        '''
        Updates the set of locations that are pending to be explored
        '''
        # Remove pending locations that have been flagged as potential pits/wumpuses by the SMT models
        self.pending_locs = set(filter(lambda pending_loc: (
                pending_loc not in self.pits_locs and
                pending_loc not in self.wumpus_locs
            ), self.pending_locs))

        # Add to pending locations tiles that are not flagged as potential pits/wumpuses by the SMT models and that are yet to be explored
        explored_locs = self.free_locs | self.breeze_locs | self.stench_locs
        
        # Filter out locations that are outside the known world boundaries
        self.pending_locs = self.pending_locs | set(filter(lambda world_loc: (
            world_loc not in self.pits_locs and
            world_loc not in self.wumpus_locs and
            world_loc not in explored_locs
        ), [(i, j) for j in range(self.world_size[1] if self.size_known else self.world_size[1] + 1) for i in range(self.world_size[0] if self.size_known else self.world_size[0] + 1)]))

        # Ensure that all pending locations are directly reachable from already explored tiles
        self.pending_locs = set(
            filter(
                lambda pending_loc: any(neighbor in explored_locs for neighbor in [tuple(map(sum,zip(pending_loc, direction.value))) for direction in Hunter.Orientation]),
                self.pending_locs
            )
        )

        # Check if further unexplored locations can be reached from the current position
        if not self.pending_locs: self.get_viable_directions()

        # Call the Bayesian module if no pending locations can be found and kill attempt has already been performed / it's not an option
        # The module returns the location with the highest likelihood (in any case above TRUTH_THRESHOLD) of not having a pit
        if not self.pending_locs and (self.arrow_used or not self.stench_locs): 
            bayes_loc = self.get_bayes_loc(Model.PIT)
            # TODO: Add bayes for wumpus?
            if bayes_loc: self.pending_locs.add(bayes_loc)
            else: self.head_out = True 

    def get_bayes_loc(self, model, checked_likelihood = False):
        '''
        Calls the bayesian module to compute the set of potential pit/wumpus locations with the corresponding probabilities.        '''
        bayes_locs = Bayesian_module().compute_models(self, model, checked_likelihood)
        if model == Model.PIT: bayes_locs = list(filter(lambda bayes_loc: bayes_loc[1] not in self.wumpus_locs, bayes_locs))

        if bayes_locs: 
            # Check if there are multiple contenders with the highest probability of being safe and pick the closest one
            bayes_locs = list(filter(lambda loc: loc[0] == bayes_locs[0][0], bayes_locs))

            if len(bayes_locs) > 1:
                bayes_paths = [AStar(self, bayes_loc[1]).run_AStar() for bayes_loc in bayes_locs]
                return bayes_locs[bayes_paths.index(min(bayes_paths, key=len))][1]
            else:
                return bayes_locs[0][1]

    def update_tile_lists(self, percepts):
        '''
        Updates the value for the current percept and the list of known stench, breeze and free tiles
        Returns true if a new breeze or stench tile is discovered
        '''
        self.curr_percepts = percepts
        new_loc = False
        if Percept.SCREAM._value_ in self.curr_percepts: 
            # After killing the wumpus, set the stench location without breeze as free
            # The (killed) wumpus location might still be occupied by a pit
            self.free_locs = self.free_locs | set(filter(lambda previous_stench: previous_stench not in self.breeze_locs, self.stench_locs))
            self.stench_locs = set()
            new_loc = True

        if Percept.STENCH._value_ in self.curr_percepts and self.agent_loc not in self.stench_locs: 
            self.stench_locs.add(self.agent_loc)
            new_loc = True
        if Percept.BREEZE._value_ in self.curr_percepts and self.agent_loc not in self.breeze_locs: 
            self.breeze_locs.add(self.agent_loc)
            new_loc = True
        if (
            Percept.STENCH._value_ not in self.curr_percepts and
            Percept.BREEZE._value_ not in self.curr_percepts and
            self.agent_loc not in self.free_locs
        ): 
            self.free_locs.add(self.agent_loc)
            new_loc = True

        return new_loc

    def update_world_size(self):
        '''
        Increases the known world size based on the current position.
        If a bump is detected among the percepts, the world size is fixed to the current value.
        Returns True if the world size has been updated, False otherwise
        '''
        initial_size = self.world_size

        if not self.size_known:
            # If a bump is detected, we can fix the world size
            # Here we assume that the agent is smart enough not to bump on the W and S walls
            
            if Percept.BUMP._value_ in self.curr_percepts: 
                self.size_known = True

                # Undo last shift in agent position
                self.agent_loc = tuple([i - j for i, j in zip(self.agent_loc, self.agent_orientation.value)])

                # The world is a square, knowing one size is enough to generalize to the true world size
                self.world_size = (max(self.agent_loc)+1, max(self.agent_loc)+1)

                # Remove locations outside the (now known) world boundaries
                self.pending_locs = list(filter(lambda x: x[0]<self.world_size[0] and x[1]<self.world_size[1], self.pending_locs))
                self.free_locs = set(filter(lambda x: x[0]<self.world_size[0] and x[1]<self.world_size[1], self.free_locs))
                self.breeze_locs = set(filter(lambda x: x[0]<self.world_size[0] and x[1]<self.world_size[1], self.breeze_locs))
                self.stench_locs = set(filter(lambda x: x[0]<self.world_size[0] and x[1]<self.world_size[1], self.stench_locs))

                return self.size_known
            elif any(i+1 > max(self.world_size) for i in self.agent_loc): 
                self.world_size = (max(self.agent_loc)+1, max(self.agent_loc)+1)  
        
        return initial_size != self.world_size

    def get_viable_directions(self):
        '''
        Given the current location of the agent, returns the (sub)set of directions that are not blocked by the environment boundaries, breeze or stench tiles
        If at least one unexplored target location is available, only the directions leading to unexplored locations are returned
        '''
        viable_directions = []
        priority_directions = []
        unexplored_targets = False

        for direction in Hunter.Orientation:
            target_loc = tuple(map(sum,zip(self.agent_loc, direction.value))) 

            # If the agent is on a breeze or stench location, use the SMT results to understand if a target location is free
            if Percept.BREEZE._value_ in self.curr_percepts or Percept.STENCH._value_ in self.curr_percepts: 
                if(
                    target_loc not in self.wumpus_locs and target_loc not in self.pits_locs and
                    not any(i<0 or i>j-1 for i, j in zip(target_loc, self.world_size))
                ): viable_directions.append(direction)
            else:
                if (
                    (not self.size_known and any(i<0 for i in target_loc)) or
                    (self.size_known and any(i<0 or i>j-1 for i, j in zip(target_loc, self.world_size))) or
                    (target_loc in self.breeze_locs) or
                    (target_loc in self.stench_locs)
                ): continue
                
                viable_directions.append(direction)
                if target_loc not in self.free_locs: 
                    priority_directions.append(direction)
                    unexplored_targets = True

                # Add target loc to the one pending to be explored
                if (
                    target_loc not in self.pending_locs and
                    target_loc not in self.free_locs and
                    target_loc not in self.breeze_locs and
                    target_loc not in self.stench_locs
                ): self.pending_locs.add(target_loc) 

        if priority_directions: return priority_directions, unexplored_targets
        else: return viable_directions, unexplored_targets

    def execute_direction(self, target_direction):
        '''
        Computes the rotation and move operations needed for the agent to travel to a given direction (N,E,S,W)
        Return the list of actions to be executed by the agent
        '''
        action_list = []
        
        # Pivot agent
        if tuple(map(sum,zip(target_direction.value, self.agent_orientation.value))) == (0, 0):
            action_list.extend([Hunter.Actions.LEFT, Hunter.Actions.LEFT])
        elif Hunter.ROT_RIGHT[self.agent_orientation] == target_direction:
            action_list.append(Hunter.Actions.RIGHT)
        elif Hunter.ROT_LEFT[self.agent_orientation] == target_direction:
            action_list.append(Hunter.Actions.LEFT)

        # Move agent
        action_list.append(Hunter.Actions.MOVE)
        return action_list

    def execute_action(self, action):
        '''
        Updates the appropriate environment variables based on the pivot, move, or shoot action passed as a parameter
        '''
        if action == Hunter.Actions.MOVE:
            self.agent_loc = tuple(map(sum,zip(self.agent_loc, self.agent_orientation.value)))
        elif action == Hunter.Actions.LEFT:
            self.agent_orientation = Hunter.ROT_LEFT[self.agent_orientation]
        elif action == Hunter.Actions.RIGHT:
            self.agent_orientation = Hunter.ROT_RIGHT[self.agent_orientation]
        elif action == Hunter.Actions.SHOOT:
            self.arrow_used = True
    
    def attempt_kill(self):
        '''
        Given one or more stench location, computes the set of actions needed to attempt a wumpus kill
        '''
        if len(self.wumpus_locs) == 1: self.kill_loc = self.wumpus_locs[0]
        else: 
            wumpus_bayes = self.get_bayes_loc(Model.WUMPUS, checked_likelihood = True) # Evaluate if it's possible to find a wumpus location candidate
            if wumpus_bayes: self.kill_loc = wumpus_bayes
            else: 
                pit_bayes = self.get_bayes_loc(Model.PIT) # If not, head towards the safest unexplored tile
                if pit_bayes: return AStar(self, pit_bayes).run_AStar()
                else: return AStar(self).run_AStar() + [Hunter.Actions.CLIMB] # If no tile matches the current threshold, leave the game

        if self.agent_loc in self.stench_locs: self.ready_to_shoot = True

        if not self.ready_to_shoot: # Travel to closest stench location
            paths_to_stench = list(filter(lambda path: path, [AStar(self, stench_loc).run_AStar() for stench_loc in self.stench_locs]))
            if paths_to_stench: 
                self.ready_to_shoot = True
                return min(paths_to_stench, key=len)
            else: return []
        else: # Pivot and shoot
            further_pivots = []
            relative_dir = AStar(self).compute_relative_dir(self.agent_loc, self.kill_loc)[0]

            if tuple(map(sum,zip(relative_dir.value, self.agent_orientation.value))) == (0, 0):
                further_pivots += [Hunter.Actions.LEFT, Hunter.Actions.LEFT]
            elif Hunter.ROT_RIGHT[self.agent_orientation] == relative_dir:
                further_pivots.append(Hunter.Actions.RIGHT)
            elif Hunter.ROT_LEFT[self.agent_orientation] == relative_dir:
                further_pivots.append(Hunter.Actions.LEFT)

            self.arrow_used = True

            further_pivots += [Hunter.Actions.SHOOT] 

            return further_pivots