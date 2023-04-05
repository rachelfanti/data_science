import itertools, enum
import networkx as nx
from sklearn import neighbors

from pgmpy.models import BayesianNetwork
from pgmpy.factors.discrete import TabularCPD
from pgmpy.inference import VariableElimination
from wumpus import Hunter

class PitProb(enum.Enum):
    TRUE = [0.2]
    FALSE = [0.8]

class Model(enum.Enum):
    WUMPUS = ['w', 's']
    PIT = ['p', 'b']

class Bayesian_module(object):
    def compute_models(self, game_env, model, checked_likelihood = False):
        '''
        checked_likelihood = False means that we are looking at the probability of a pit/wumpus not being in a location
        checked_likelihood = True only when we are computing the probability of a wumpus being in a location in order to attempt a kill
        '''
        def wumpus_cpd(name, evidence, bool_fn):
            def cpd_values(bool_fn, arity):
                def bool_to_prob(*args) -> bool:
                    return (1.0, 0.0) if bool_fn(*args) else (0.0, 1.0)
                
                return tuple(zip(*[bool_to_prob(*ps) for ps in itertools.product((True, False), repeat=arity)]))

            return TabularCPD(
                variable=name, variable_card=2,
                values=cpd_values(bool_fn, len(evidence)),
                evidence=evidence, evidence_card=[2] * len(evidence),
                state_names={n: [True, False] for n in [name] + evidence}
            )

        if game_env.size_known: 
            world_locs = [(i, j) for j in range(game_env.world_size[1]) for i in range(game_env.world_size[0])]
            assumed_size = game_env.world_size
        else: 
            world_locs = [(i, j) for j in range(game_env.world_size[1]+1) for i in range(game_env.world_size[0]+1)]
            assumed_size = (game_env.world_size[0]+1, game_env.world_size[1]+1)

        explored_locs = list(filter(lambda curr_loc: curr_loc in game_env.free_locs or curr_loc in game_env.breeze_locs or curr_loc in game_env.stench_locs, world_locs))

        p_cpds = {} # Percept (stench/breeze) cpd
        d_cpds = {} # Danger (wumpus/pit) cpd

        for i,j in world_locs:
            d_cpds[(i, j)] = TabularCPD(
                variable=f'{model._value_[0]}{i}{j}', variable_card=2, 
                values=[
                    PitProb.TRUE._value_ if model == Model.PIT else [1 / (len(world_locs) - 1)], 
                    PitProb.FALSE._value_ if model == Model.PIT else [1 - (1 / (len(world_locs) - 1))]
                ], 
                state_names={f'{model._value_[0]}{i}{j}': [True, False]})

        for i,j in explored_locs:
            key = (i,j)

            neighbors = list(filter(lambda neighbor: not any(i<0 or i>j-1 for i, j in zip(neighbor, assumed_size)), [tuple(map(sum,zip((i,j), direction.value))) for direction in Hunter.Orientation]))
            
            val = wumpus_cpd(
                f'{model._value_[1]}{i}{j}',
                [f'{model._value_[0]}{i}{j}' for i,j in neighbors],
                eval('lambda ' + ', '.join([f'{model._value_[0]}{i}{j}' for i,j in neighbors]) + ': (' + ' or '.join([f'{model._value_[0]}{i}{j}' for i,j in neighbors]) + ')')
            )

            p_cpds[key] = val

        exp_model = BayesianNetwork()

        for p in p_cpds.values():
            for e in p.get_evidence():
                exp_model.add_edge(e, p.variable)
                
        exp_model.add_nodes_from([p.variable for p in d_cpds.values()])
        exp_model.add_cpds(*p_cpds.values())
        exp_model.add_cpds(*d_cpds.values())

        assert exp_model.check_model()
        exp_infer = VariableElimination(exp_model)

        evidence_vals = {}
        for i,j in explored_locs: 
            if model == Model.PIT: evidence_vals[f'{model._value_[1]}{i}{j}'] = (i,j) in game_env.breeze_locs
            else: evidence_vals[f'{model._value_[1]}{i}{j}'] = (i,j) in game_env.stench_locs
            evidence_vals[f'{model._value_[0]}{i}{j}'] = False

        # Iterate through all fringe locations
        fringe_locs = list(filter(
            lambda unexplored_loc: 
                any(unexplored_neighbor in explored_locs for unexplored_neighbor in [tuple(map(sum,zip(unexplored_loc, direction.value))) for direction in Hunter.Orientation]),
                [(i,j) for i,j in set(world_locs).difference(set(explored_locs))]
        ))

        res = []
        for i,j in fringe_locs:
            #print(exp_infer.query([f'{model._value_[0]}{i}{j}'], evidence = evidence_vals, show_progress = False))
            prob = exp_infer.query([f'{model._value_[0]}{i}{j}'], evidence = evidence_vals, show_progress = False)
            prob = prob.values[1] if checked_likelihood == False else prob.values[0]
            if (model == Model.WUMPUS and checked_likelihood == True) or prob > game_env.truth_threshold: res.append((prob, (i,j)))

        res.sort(key=lambda y: y[0])
        return res



