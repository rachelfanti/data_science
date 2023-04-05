import enum, collections
from operator import sub
from matplotlib.style import available
from scipy.spatial import distance

class GameStatus(enum.Enum):
    RUNNING = 1
    OVER = 2

class HeuristicApproach(enum.Enum):
    NONE = 1
    MANHATTAN_SUM = 2
    MANHATTAN_MIN = 3
    MANHATTAN_MAX = 4
    MANHATTAN_MIN_MAX = 5
    MANHATTAN_PATH = 6

class GameEnvironment(object):
    '''
    Represents the game environment
    '''
    MOVEMENT_COST = 1
    FOOD_COST = -10

    def __init__(self, world_size, agent_start_loc, food_locations, block_locations, all_actions, heuristic = HeuristicApproach.NONE):
        '''
        world_size:
            A tuple containing the x and y size (in nr of blocks) of the game environemnt
        agent_start_loc:
            A tuple containing the x and y coordinates for the starting location of the agent
        food_locations:
            A list of tuples each containing the x and y coordinates of a given food item
        block_locations:
            A list of tuples each containing the x and y coordinates of a given block item
        all_actions:
            A dictionary containing the set of available actions, together with their coordinates effects on the agent position
        heuristic:
            Heuristic utilized in the execution of the AStar algorithm. Default value is NONE
        '''
        self.world_size = world_size 
        self.agent_start_loc = agent_start_loc 
        self.agent_loc = agent_start_loc
        self.food_locations = food_locations 
        self.block_locations = block_locations 
        self.all_actions = all_actions
        self.consumed_food = []
        self.agent_path = []
        self.path_cost = 0
        self.heuristic = heuristic
        self.game_status = GameStatus.RUNNING

    def get_viable_actions(self):
        '''
        Given the current location of the agent, returns the (sub)set of actions that are not nullified by block items
        '''
        viable_actions = []

        for action in self.all_actions:
            target_loc = tuple(map(sum,zip(self.agent_loc, action.value))) 

            # Check if target location is out of environment boundaries. Env coordinates start from value 0
            if any(i<0 or i>j-1 for i, j in zip(target_loc, self.world_size)): continue

            # Check if target location is on block item
            if target_loc in self.block_locations: continue

            viable_actions.append(action)
        
        return viable_actions

    def execute_action(self, action):
        '''
        Executes the action by updating the agent location and path. 
        If the target location contains a food item, the item is added to the list of consumed food
        '''
        target_loc = tuple(map(sum,zip(self.agent_loc, action.value)))

        if target_loc == self.agent_loc:
            return

        self.agent_loc = target_loc

        self.agent_path.append(action)     
        self.path_cost += self.MOVEMENT_COST  

        # We don't want to consume food multiple times
        if (self.agent_loc in self.food_locations) and (self.agent_loc not in self.consumed_food):
            self.consumed_food.append(self.agent_loc)
            self.path_cost += self.FOOD_COST

        self.check_game_status()

    def check_game_status(self):
        '''
        Checks the status of the current game and updates it to 'over' if all food items have been consumed
        '''
        if(collections.Counter(self.food_locations) == collections.Counter(self.consumed_food)):
            self.game_status = GameStatus.OVER
        else:
            self.game_status = GameStatus.RUNNING

        return self.game_status

    def reset_game(self):
        '''
        Resets the game (agent position, consumed food, path & game status) to the starting configuration
        '''
        self.agent_loc = self.agent_start_loc
        self.consumed_food = []
        self.agent_path = []
        self.path_cost = 0

        self.check_game_status()

    def load_checkpoint(self, checkpoint_loc, checkpoint_food, checkpoint_path, checkpoint_cost = 0):
        '''
        Restores the game (agent position, consumed food, path & game status) to a specific configuration given some checkpoint variables
        '''
        self.agent_loc = checkpoint_loc
        self.consumed_food = checkpoint_food
        self.agent_path = checkpoint_path
        self.path_cost = checkpoint_cost
        
        self.check_game_status()

    def load_path(self, path):
        '''
        Restores the game (agent position, consumed food, path & game status) to a specific configuration given a path
        '''
        self.reset_game()

        if path is not None:
            for action in path: self.execute_action(action)

    def get_heuristic(self):
        heuristic = 0
        remaining_food = list(set(self.food_locations) - set(self.consumed_food))
        distance_list = [distance.cityblock(self.agent_loc, food_item) for food_item in remaining_food]

        if self.heuristic == HeuristicApproach.MANHATTAN_SUM:
            for food_item in remaining_food: heuristic += distance.cityblock(self.agent_loc, food_item)
            return heuristic
        elif self.heuristic == HeuristicApproach.MANHATTAN_MIN:
            return min(distance_list) if distance_list else 0
        elif self.heuristic == HeuristicApproach.MANHATTAN_MAX:
            return max(distance_list) if distance_list else 0
        elif self.heuristic == HeuristicApproach.MANHATTAN_MIN_MAX:
            return min(distance_list) + max(distance_list) if distance_list else 0
        elif self.heuristic == HeuristicApproach.MANHATTAN_PATH:
            while remaining_food:
                heuristic += min(distance_list)

                idx = distance_list.index(min(distance_list))
                pos = remaining_food[idx]
                remaining_food.pop(idx)

                # Recompute distance list on new position and remaining food
                distance_list = [distance.cityblock(pos, food_item) for food_item in remaining_food]

            return heuristic
        else:
            return 0

        # Heuristic 2 - Distance between the two furthest away food items (x) + Distance between agent and closest of the two food items usded in x
        # Idea from Stack Overflow: https://stackoverflow.com/questions/9994913/pacman-what-kinds-of-heuristics-are-mainly-used
