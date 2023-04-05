import time, math, copy
from queue import PriorityQueue
from collections import namedtuple
from scipy.spatial import distance

from wumpus import Hunter

QueueItem = namedtuple('QueueItem', 'COST HEURISTIC ID PATH') # Heuristic added for tie breaking
Solution = namedtuple('Solution', 'COST PATH')

class AStar(object):
    '''
    Uses already discovered locations to compute an optimal path between origin and target
    Builds an action list that is consumed by the online agent
    Starting code taken from Assignment 3
    '''
    def __init__(self, game_env, target_location = None):
        self.game_env = copy.deepcopy(game_env)

        self.agent_path = []
        self.path_cost = 0
        
        if target_location: self.target_location = target_location
        else: self.target_location = self.game_env.START_LOC

        self.agent_loc = self.game_env.agent_loc
        self.agent_orientation = self.game_env.agent_orientation

    def run_AStar(self):
        priority_queue = PriorityQueue()
        priority_queue.put(QueueItem(self.get_heuristic(), self.get_heuristic(), None, None)) # Root node

        reached = {} # Key is node coordinates. Value is lowest cost found to reach the state
        solution = Solution(math.inf, []) # Solution cost and path
        
        while not priority_queue.empty():
            queue_item = priority_queue.get()

            if solution.PATH and (solution.COST <= queue_item.COST):
                break

            self.load_path(queue_item.PATH)

            for direction in self.get_viable_directions():
                action_list = self.execute_direction(direction)
                self.agent_path += action_list
                self.path_cost += len(action_list)
                
                # We add the path to the queue only if it's the first time we reach the target node or if the current path is cheaper 
                # than the previously found one (given the same configuration)
                stored_cost = reached.get((self.agent_loc))

                if (stored_cost is None) or (self.path_cost + self.get_heuristic() < stored_cost):
                    reached[(self.agent_loc)] = self.path_cost + self.get_heuristic()

                    if self.agent_loc == self.target_location:
                        # Make sure that current solution is cheaper than the previously stored one
                        if self.path_cost < solution.COST: solution = Solution(self.path_cost, self.agent_path)
                    # Items are put back in the priority queue only if they are not complete solutions
                    else:
                        # The string generated for the ID element avoids error when ordering paths with the same cost
                        priority_queue.put(QueueItem(self.path_cost + self.get_heuristic(), self.get_heuristic(), ' '.join(e.name for e in self.agent_path), self.agent_path)) 
                self.load_path(queue_item.PATH)

        self.reset_game()
        return solution.PATH

    def reset_game(self):
        '''
        Resets the game to the starting configuration
        '''
        self.agent_loc = self.game_env.agent_loc
        self.agent_orientation = self.game_env.agent_orientation

        self.agent_path = []
        self.path_cost = 0

    def load_path(self, path):
        '''
        Restores the game variables to a specific configuration given a path
        '''
        self.reset_game()

        if path is not None:
            self.execute_action_list(path)
            self.agent_path += path
            self.path_cost += len(path) 

    def get_heuristic(self):
        '''
        Computes (and returns) the integer value of the chosen heuristic given the current agent position
        '''
        heuristic = 0

        heuristic += distance.cityblock(self.agent_loc, self.target_location) # Manhattan distance
        heuristic += self.compute_manhattan_pivots(self.agent_loc, self.target_location, [self.agent_orientation])
        if self.target_location == self.game_env.START_LOC: heuristic += 1 # Climb cost

        return heuristic

    def compute_manhattan_pivots(self, origin_loc, target_loc, origin_orientation):
        '''
        Computes the (minimum) number of pivots required when moving from a origin to a target location given a certain starting orientation
        '''
        pivots = 0
        if origin_loc == target_loc: return pivots

        relative_dir = self.compute_relative_dir(origin_loc, target_loc)

        # If our orientation appears in the relative direction we have to go to, we don't have to pivot
        # Example: If we are facing N, we don't need to pivot to go N, NW & NE
        # If the relative direction we have to go to contains an adjacent direction to the one we are facing, we need to pivot only once
        # Example: If we are facing N, we pivot only once to go W, SW, E & SE
        # If the relative direction we have to go to is the complete opposite (e.g: facing N and needing to go S), we need to pivot twice
        if any(orientation in relative_dir for orientation in origin_orientation):
            pivots += 0
        elif any((Hunter.ROT_RIGHT[orientation] in relative_dir) or (Hunter.ROT_LEFT[orientation] in relative_dir) for orientation in origin_orientation):
            pivots += 1
        else:
            pivots += 2

        # Add pivots to be performed during movement
        if (origin_loc[0] != target_loc[0]) and (origin_loc[1] != target_loc[1]): pivots += 1

        return pivots

    def compute_relative_dir(self, origin_loc, target_loc):
        '''
        Given origin and target coordinates, it computes the relative position of the target with regards to the origin.
        Possible results are: [N], [N,E], [E], [S,E], [S], [S, W], [W], [N, W] 
        '''
        relative_dir = []

        if target_loc[0] > origin_loc[0]: relative_dir.append(Hunter.Orientation.E)
        elif target_loc[0] < origin_loc[0]: relative_dir.append(Hunter.Orientation.W)

        if target_loc[1] > origin_loc[1]: relative_dir.append(Hunter.Orientation.N)
        elif target_loc[1] < origin_loc[1]: relative_dir.append(Hunter.Orientation.S)

        return relative_dir

    def get_viable_directions(self):
        '''
        Returns the set of directions that lead to a location that has been already explored (free/breeze/stench) or that is in among the pending locations
        '''
        viable_directions = []

        for direction in Hunter.Orientation:
            target_loc = tuple(map(sum,zip(self.agent_loc, direction.value))) 
            
            if(
                target_loc in self.game_env.free_locs or 
                target_loc in self.game_env.breeze_locs or 
                target_loc in self.game_env.stench_locs or
                target_loc in self.game_env.pending_locs or
                target_loc == self.target_location
            ): viable_directions.append(direction)
            else: continue
        
        return viable_directions

    def execute_direction(self, target_direction):
        '''
        Computes the rotation and move/shoot operations needed for the agent to travel to a given direction (N,E,S,W)
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
        
        self.execute_action_list(action_list)
        return action_list

    def execute_action_list(self, action_list):
        '''
        Updates the environment variables based on the pivot, move, grab, climb or shoot action contained in the action list
        '''
        for action in action_list:
            if action == Hunter.Actions.MOVE:
                self.agent_loc = tuple(map(sum,zip(self.agent_loc, self.agent_orientation.value)))
            elif action == Hunter.Actions.LEFT:
                self.agent_orientation = Hunter.ROT_LEFT[self.agent_orientation]
            elif action == Hunter.Actions.RIGHT:
                self.agent_orientation = Hunter.ROT_RIGHT[self.agent_orientation]