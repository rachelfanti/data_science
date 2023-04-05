import enum, copy, math
from re import L
from timeit import repeat
from matplotlib.pyplot import fill
from numpy import add
from scipy.spatial import distance
from wumpus import Hunter

class GameStatus(enum.Enum):
    RUNNING = 1
    OVER = 2

class HeuristicApproach(enum.Enum):
    NONE = 1
    MANHATTAN_SIMPLE = 2
    MANHATTAN_PIVOTS = 3
    MANHATTAN_OBSTACLE = 4
    MANHATTAN_ITERATIVE_SHIFT = 5
    FLOOD_FILL = 6
    AREA_PRUNING = 7

class ManhattanShape(enum.Enum):
    STRAIGHT = 1
    ELBOW = 2

class GameEnvironment(object):
    '''
    Represents the game environment
    '''
    START_LOC = (0, 0)
    WIN_COST = -1000
    ACTIONS_COST = {
        Hunter.Actions.MOVE: 1,
        Hunter.Actions.RIGHT: 1,
        Hunter.Actions.LEFT: 1,
        Hunter.Actions.SHOOT: 10,
        Hunter.Actions.GRAB: 1,
        Hunter.Actions.CLIMB: 1
    }

    def __init__(self, world_size, gold_loc, wumpus_loc, pit_locs, heuristic = HeuristicApproach.NONE):
        '''
        world_size:
            A tuple containing the x and y size (in nr of blocks) of the game environment
        gold_loc:
            A tuple containing the x and y coordinates of the gold item
        wumpus_loc:
            A tuple containing the x and y coordinates of the wumpus item
        pit_locs:
            A list of tuples each containing the x and y coordinates of the pit items
        heuristic:
            Heuristic utilized in the execution of the AStar algorithm. Default value is NONE
        '''
        self.world_size = world_size 
        self.gold_loc = gold_loc
        self.wumpus_loc = wumpus_loc 
        self.pit_locs = pit_locs 
        self.agent_loc = self.START_LOC
        self.agent_orientation = Hunter.Orientation.N
        self.taken_gold = False
        self.killed_wumpus = False
        self.climbed_out = False
        self.agent_path = []
        self.path_cost = 0
        self.heuristic = heuristic
        self.game_status = GameStatus.RUNNING

        self.mandatory_shoot = False
        self.impossible_game = False

        # Run the flooding algorithm only once per iteration
        if self.heuristic.value >= HeuristicApproach.FLOOD_FILL.value: 
            fill_locs = self.flood_fill(self.agent_loc)
            if (self.gold_loc not in set(fill_locs[0]).union(set(fill_locs[1]))): self.impossible_game = True
            elif self.gold_loc in fill_locs[1]: self.mandatory_shoot = True

        if self.heuristic.value >= HeuristicApproach.AREA_PRUNING.value: self.perform_area_pruning() 

    def get_viable_directions(self, start_loc = None, consider_shoot = True, consider_wumpus = True):
        '''
        Given the current location of the agent, returns the (sub)set of directions that are not blocked by the environment boundaries, pits or wumpus items
        Additionally, checks if from the current position it is possible to kill the wumpus
        '''
        if start_loc is None: start_loc = self.agent_loc
        viable_directions = []

        for direction in Hunter.Orientation:
            target_loc = tuple(map(sum,zip(start_loc, direction.value))) 

            # Check if target location is out of environment boundaries. Env coordinates start from value 0
            if any(i<0 or i>j-1 for i, j in zip(target_loc, self.world_size)): continue

            # Check if target location is a pit item or wumpus (if wumpus is still alive and considered)
            if (target_loc in self.pit_locs) or (consider_wumpus and target_loc == self.wumpus_loc and not self.killed_wumpus): continue

            viable_directions.append(direction)

        # Additionally, check if the wumpus is killable from the current position
        if consider_shoot and (not self.killed_wumpus) and ((start_loc[0] == self.wumpus_loc[0]) or (start_loc[1] == self.wumpus_loc[1])):
            viable_directions.append(Hunter.Actions.SHOOT)
        
        return viable_directions

    def execute_direction(self, target_direction):
        '''
        Executes the rotation and move/shoot operations needed for the agent to travel to a given direction (N,E,S,W) or to kill the wumpus
        '''
        current_action = Hunter.Actions.MOVE

        # If action is shoot, compute wumpus direction relative to the agent
        if target_direction == Hunter.Actions.SHOOT:
            current_action = Hunter.Actions.SHOOT
            target_direction = self.compute_relative_dir(self.agent_loc, self.wumpus_loc)[0]
        
        # Pivot agent
        if tuple(map(sum,zip(target_direction.value, self.agent_orientation.value))) == (0, 0):
            self.execute_action(Hunter.Actions.LEFT, Hunter.Actions.LEFT)
        elif Hunter.ROT_RIGHT[self.agent_orientation] == target_direction:
            self.execute_action(Hunter.Actions.RIGHT)
        elif Hunter.ROT_LEFT[self.agent_orientation] == target_direction:
            self.execute_action(Hunter.Actions.LEFT)

        # Move or kill
        self.execute_action(current_action)

    def execute_action(self, action, additional_action = None):
        '''
        Executes a pivot, move, grab, climb or shoot action
        '''
        if action == Hunter.Actions.MOVE:
            self.agent_loc = tuple(map(sum,zip(self.agent_loc, self.agent_orientation.value)))
            if (self.agent_loc == self.gold_loc) and (self.taken_gold == False): additional_action = Hunter.Actions.GRAB # Grab the gold
            if (self.agent_loc == self.START_LOC) and (self.taken_gold): additional_action = Hunter.Actions.CLIMB # Climb out
        elif action == Hunter.Actions.LEFT:
            self.agent_orientation = Hunter.ROT_LEFT[self.agent_orientation]
        elif action == Hunter.Actions.RIGHT:
            self.agent_orientation = Hunter.ROT_RIGHT[self.agent_orientation]
        elif action == Hunter.Actions.GRAB:
            self.taken_gold = True
        elif action == Hunter.Actions.CLIMB:
            self.climbed_out = True
        elif action == Hunter.Actions.SHOOT:
            self.killed_wumpus = True

        self.agent_path.append(action)
        self.path_cost += self.ACTIONS_COST[action]

        if additional_action: self.execute_action(additional_action)

        self.check_game_status()

    def check_game_status(self):
        '''
        Checks the status of the current game and updates it to OVER if the agent has climbed out
        '''
        if self.climbed_out: self.game_status = GameStatus.OVER
        else: self.game_status = GameStatus.RUNNING

        return self.game_status

    def reset_game(self):
        '''
        Resets the game to the starting configuration
        '''
        self.agent_loc = self.START_LOC
        self.agent_orientation = Hunter.Orientation.N
        self.taken_gold = False
        self.killed_wumpus = False
        self.climbed_out = False
        self.agent_path = []
        self.path_cost = 0

        self.check_game_status()

    def load_path(self, path):
        '''
        Restores the game to a specific configuration given a path
        '''
        self.reset_game()

        if path is not None:
            for action in path: 
                if action != Hunter.Actions.GRAB: self.execute_action(action)

    def get_heuristic(self):
        '''
        Computes (and returns) the integer value of the chosen heuristic given the current agent position
        '''
        if self.impossible_game: return -1 # Impossible game

        heuristic = 0
        if self.taken_gold: target_location = self.START_LOC 
        else: target_location = self.gold_loc

        if self.gold_loc == self.wumpus_loc: self.mandatory_shoot = True

        if self.heuristic == HeuristicApproach.NONE: return heuristic
        if self.heuristic.value >= HeuristicApproach.MANHATTAN_SIMPLE.value: heuristic += self.compute_manhattan_simple(self.agent_loc, target_location)
        if self.heuristic.value >= HeuristicApproach.MANHATTAN_PIVOTS.value: heuristic += self.compute_manhattan_pivots(self.agent_loc, target_location, [self.agent_orientation])
        if self.heuristic.value >= HeuristicApproach.MANHATTAN_OBSTACLE.value: heuristic += self.compute_manhattan_obstacle(self.agent_loc, target_location, [self.agent_orientation])

        if not self.taken_gold: heuristic += self.ACTIONS_COST[Hunter.Actions.GRAB]
        if not self.climbed_out: heuristic += self.ACTIONS_COST[Hunter.Actions.CLIMB]
        if (not self.killed_wumpus) and self.mandatory_shoot: heuristic += self.ACTIONS_COST[Hunter.Actions.SHOOT]

        return heuristic

    def compute_manhattan_simple(self, origin_loc, target_loc):
        '''
        A simple computation of the manhattan distance between agent and goal
        If the gold has been already taken, this is the distance between the agent and the starting location
        If the gold has not been already taken, this is the distance between tha agent and the gold + the distance between the gold and the start location
        '''
        if target_loc == self.START_LOC: 
            return distance.cityblock(origin_loc, self.START_LOC)
        else: 
            return distance.cityblock(origin_loc, self.gold_loc) + self.compute_manhattan_simple(self.gold_loc, self.START_LOC)

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

        if target_loc == self.START_LOC: 
            return pivots
        else:
            # The element(s) in the relative dir list denote the (possible) way(s) the agent will be facing when it reaches the destination
            # Example:  If the target location is in the relative direction NE, 
            #           when arriving to the destination the agent will be facing either N or E depending on the taken manhattan path
            return pivots + self.compute_manhattan_pivots(self.gold_loc, self.START_LOC, relative_dir)

    def compute_manhattan_obstacle(self, origin_loc, target_loc, origin_orientation):
        '''
        Computes the minimum nr of additional pivots required to avoid a pit that lies on the (manhattan) path between origin and target location
        If the corresponding flag is set to true, the nr of additional moves is also considered
        '''
        additional_pivots = 0
        additional_moves = 0

        if origin_loc == target_loc: return additional_pivots

        relative_dir = self.compute_relative_dir(origin_loc, target_loc)
        manhattan_paths = self.compute_manhattan_paths(origin_loc, target_loc, relative_dir)

        # If the relative direction of the target with relation to the origin is N, S, E or W, there is only one manhattan path and it is a straight line
        if len(manhattan_paths) == 1 and any(obstacle in manhattan_paths[0] for obstacle in self.pit_locs):
            if origin_orientation == relative_dir: additional_pivots += 3
            else: additional_pivots += 1

            if self.heuristic.value >= HeuristicApproach.MANHATTAN_ITERATIVE_SHIFT.value: 
                # Path shift to adjacent direction. Example: If relative direction is N, attempt path shift to E and W
                shift_dirs = [Hunter.ROT_RIGHT[relative_dir[0]], Hunter.ROT_LEFT[relative_dir[0]]]

                shift_moves = math.inf
                for dir in shift_dirs: 
                    curr_moves = self.attempt_path_shift(manhattan_paths[0], ManhattanShape.STRAIGHT, origin_loc, dir)
                    if curr_moves < shift_moves: shift_moves = copy.deepcopy(curr_moves)
                if shift_moves != math.inf: additional_moves += shift_moves

        # If the relative direction is NE, SE, SW or NW, there are always two (elbow shaped) manhattan paths from the origin to the target
        # In this situation, we require AT LEAST one extra pivot to avoid an obstacle appearing in the path
        # Note that we add the cost only if obstacles appear in BOTH paths (to avoid having the heuristic overestimate the true path cost)
        elif any(obstacle in manhattan_paths[0] for obstacle in self.pit_locs) and any(obstacle in manhattan_paths[1] for obstacle in self.pit_locs):
            additional_pivots += 1

            if self.heuristic.value >= HeuristicApproach.MANHATTAN_ITERATIVE_SHIFT.value:
                # Attempt path shift on both paths, keep the one requiring fewer shifts
                shift_moves = math.inf
                for path in manhattan_paths:
                    curr_moves = self.attempt_path_shift(path, ManhattanShape.ELBOW, origin_loc)
                    if curr_moves < shift_moves: shift_moves = copy.deepcopy(curr_moves)
                if shift_moves != math.inf: additional_moves += shift_moves

        if target_loc == self.START_LOC: 
            return additional_pivots + additional_moves
        else:
            return additional_pivots + additional_moves + self.compute_manhattan_obstacle(self.gold_loc, self.START_LOC, relative_dir)

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

    def compute_manhattan_paths(self, origin_loc, target_loc, relative_dir):
        '''
        Computes the manhattan path(s) between an origin and target location
        '''
        # Relative direction is N, E, S or W (one manhattan path)
        if len(relative_dir) == 1:
            if(origin_loc[0] == target_loc[0]):
                if origin_loc[1] < target_loc[1]: sol = [[(origin_loc[0], i) for i in range(origin_loc[1], target_loc[1])]]
                else: sol = [[(origin_loc[0], i) for i in range(target_loc[1], origin_loc[1])]]
            else:
                if origin_loc[0] < target_loc[0]: sol = [[(i, origin_loc[1]) for i in range(origin_loc[0], target_loc[0])]]
                else: sol = [[(i, origin_loc[1]) for i in range(target_loc[0], origin_loc[0])]]
        # Relative direction is NE, SE, SW or NW (two manhattan paths)
        else:
            path_1 = []
            path_2 = []

            if origin_loc[0] < target_loc[0]: x_offset = range(origin_loc[0], target_loc[0]+1)
            else: x_offset = range(target_loc[0], origin_loc[0]+1)

            if origin_loc[1] < target_loc[1]: y_offset = range(origin_loc[1], target_loc[1]+1)
            else: y_offset = range(target_loc[1], origin_loc[1]+1)

            for y in y_offset:
                path_1.append((x_offset[0], y))
                path_2.append((x_offset[-1], y))

            for x in x_offset:
                path_1.append((x, y_offset[-1]))
                path_2.append((x, y_offset[0]))

            sol = [path_1, path_2]

        # Removing start and target location from path(s) before returning the solution
        return [set(path) - set([origin_loc, target_loc]) for path in sol]

    def attempt_path_shift(self, manhattan_path, manhattan_shape, origin_loc, shift_dir = None):
        '''
        Repeatedly shifts the provided manhattan path (and adds the corresponding extra movements) until an obstacle-free alternative is found.
        '''
        additional_moves = 0

        # Straight path (all elements in the path share either the same x or y values)
        if manhattan_shape == ManhattanShape.STRAIGHT:
            shifted_path = [tuple(map(sum, zip(loc, shift_dir.value))) for loc in manhattan_path]

            # Check if path is within the world boundaries and if it contains obstacles
            if (
                all([i and j for i, j in [((i>=0 and i<j) for i, j in zip(loc, self.world_size)) for loc in manhattan_path]]) and 
                any(obstacle in manhattan_path for obstacle in self.pit_locs) 
            ):
                additional_moves += 2

                # Perform further shifts only if there are pits that are directly in contact to pits from the previous iteration
                if self.check_contacting_pits(shift_dir, shifted_path): additional_moves += self.attempt_path_shift(shifted_path, manhattan_shape, origin_loc, shift_dir) 
        # Elbow shaped path
        else:
            # Decompose the elbow shaped path into two straight ones (agent and perpendicular path)
            agent_path = list(filter(lambda x: (x[0] == origin_loc[0]) or (x[1] == origin_loc[1]), manhattan_path))
            perp_path = list(set(manhattan_path) - set(agent_path))

            # If obstacle is in path stemming from agent, no extra moves are added
            if any(obstacle in agent_path for obstacle in self.pit_locs): return additional_moves

            # If obstacle is not in path stemming from agent, check if we can shift towards the agent to find free paths
            shift_dir = self.compute_relative_dir(agent_path[0], origin_loc)[0] # Towards the agent
            shifted_path = copy.deepcopy(perp_path)

            # If a free path is found while shifting towards the agent, no extra movement is added
            while (shifted_path[0][0] != origin_loc[0]) and (shifted_path[0][1] != origin_loc[1]): 
                shifted_path = [tuple(map(sum, zip(loc, shift_dir.value))) for loc in shifted_path]
                if all(obstacle not in agent_path for obstacle in self.pit_locs): return additional_moves 

            # Shift away from the agent and add two additional moves per shift
            shift_dir = self.compute_relative_dir(origin_loc, agent_path[0])[0] # Away from the agent
            shifted_path = [tuple(map(sum, zip(loc, shift_dir.value))) for loc in shifted_path]

            # While path is within the world boundaries and it contains obstacles that are directly in contact to pits from the previous iteration
            while all([i and j for i, j in [((i>=0 and i<j) for i, j in zip(loc, self.world_size)) for loc in shifted_path]]):
                if any(obstacle in shifted_path for obstacle in self.pit_locs): additional_moves += 2   
                else: break

                # Perform further shifts only if there are pits that are directly in contact to pits from the previous iteration
                if self.check_contacting_pits(shift_dir, shifted_path) == False: break
                shifted_path = [tuple(map(sum, zip(loc, shift_dir.value))) for loc in shifted_path]

        return additional_moves

    def check_contacting_pits(self, shift_dir, shifted_path):
        '''
        Given a shift direction and a path that has already been shifted, check if at least one of the pits appearing in the shifted path is directly touching a pith from the adjacent direction we came from
        For instance, if we are shifting E, for a given pit in the shifted path we will check the tiles that are on its NW, W and SW
        '''
        return any(
            (
                contact_loc in self.pit_locs 
                for contact_loc in [
                    curr_pit, 
                    tuple(map(sum, zip(curr_pit, Hunter.ROT_RIGHT[shift_dir].value))), 
                    tuple(map(sum, zip(curr_pit, Hunter.ROT_LEFT[shift_dir].value)))
                ]
            ) 
                for curr_pit in [
                    (tuple(map(sum, zip(pit_loc, tuple(-coordinate for coordinate in shift_dir.value))))) 
                        for pit_loc in shifted_path if pit_loc in self.pit_locs
                ]
        )

    def flood_fill(self, loc, consider_wumpus = True):
        '''
        Executes a flooding algorithm starting from a given location
        Returns a list with two elements:
            The first element contains the flooded coordinates from the starting location 
            The second element contains the flooded coordinates from the wumpus location (if the wumpus has been encountered in the first part of the flooding)
        '''
        filled = [[loc], []] # Filled from agent, filled after wumpus
        borders = []

        for curr_area in filled:
            for loc in curr_area:
                viable_directions = self.get_viable_directions(start_loc = loc, consider_shoot = False, consider_wumpus = consider_wumpus)

                for blocked_direction in (set(Hunter.Orientation) - set(viable_directions)):
                    borders.append(tuple(map(sum,zip(loc, blocked_direction.value))))

                for direction in viable_directions:
                    target_node = tuple(map(sum,zip(loc, direction.value)))
                    if (target_node not in filled[0]) and (target_node not in filled[1]): curr_area.append(target_node) 
            
            # Decide if it's needed to continue to fill from wumpus
            if self.gold_loc in filled[0] or not consider_wumpus or self.wumpus_loc not in borders: break
            elif self.wumpus_loc not in filled[1]: filled[1].append(self.wumpus_loc)

        return filled

    def perform_area_pruning(self):
        '''
        Selects the smallest (rectangular) area that covers both the starting location and the gold and sets it as the new world size.
        Then, executes flood filling from the start location and checks if the gold is reachable from the new world. 
        If that is not the case, increases the world size by one in both directions and tries again.
        '''
        orig_size = self.world_size
        self.world_size = tuple([i-1 for i in self.gold_loc])
        
        while any([i<j for i,j in zip(self.world_size, orig_size)]) and (self.gold_loc not in self.flood_fill(self.START_LOC, consider_wumpus = False)[0]):
            self.world_size = tuple([i+1 if i<j else i for i,j in zip(self.world_size, orig_size)])