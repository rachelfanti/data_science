import copy, time
from typing import Iterable

from wumpus import OfflinePlayer, Eater, EaterWorld, Food
from game_env import GameEnvironment, GameStatus

class IDPlayer(OfflinePlayer):
    """
    Offline player using the interative deepening depth-first search
    """
    def IDDFS(self, game_env):
        '''
        Starts the computation for the Iterative Deepening Depth-First Search on the current game environment
        Starting point for algorithm pseudocode from Wikipedia: https://en.wikipedia.org/wiki/Iterative_deepening_depth-first_search
        A list keeping track of the already visited states has been added in order to improve performance
        '''
        def print_results(path, node_counter, exec_time):
            print("---------- RESULT ---------")
            print(f"The algorithm has explored {node_counter} node(s)")
            print(f"Search was completed in {exec_time} seconds")
            if path:
                print("Found solution: ")
                print(path)
            else:
                print("No viable solution was found!")
            print("---------------------------")
            return path

        start_time = time.time()
        node_counter = 1

        reached = [(game_env.agent_loc, set(game_env.consumed_food))]

        for depth in range((game_env.world_size[0] * game_env.world_size[1]) - len(game_env.block_locations)):
            game_env.reset_game() 
            (path_actions, remaining, node_counter) = self.RDLS(game_env, depth, reached, node_counter)

            if path_actions:
                return print_results(path_actions, node_counter, round(time.time() - start_time, 6))
            if not remaining:
                return print_results([], node_counter, round(time.time() - start_time, 6))

        return print_results([], node_counter, round(time.time() - start_time, 6))

    def RDLS(self, game_env, depth, reached, node_counter):
        node_counter += 1

        if depth == 0:
            if game_env.check_game_status() == GameStatus.OVER:
                return (game_env.agent_path, True, node_counter)
            else:
                return (None, True, node_counter)
        else:
            any_remaining = False

            for action in game_env.get_viable_actions():
                # Storing checkpoint variables
                (checkpoint_location, checkpoint_food, checkpoint_path) = (copy.deepcopy(game_env.agent_loc), copy.deepcopy(game_env.consumed_food), copy.deepcopy(game_env.agent_path))
                game_env.execute_action(action)

                if (game_env.agent_loc, set(game_env.consumed_food)) not in reached:

                    reached_copy = copy.deepcopy(reached)
                    reached_copy.append((game_env.agent_loc, set(game_env.consumed_food)))
                    
                    (path_actions, remaining, node_counter) = self.RDLS(game_env, depth-1, reached_copy, node_counter)
                    
                    if path_actions is not None:
                        return (path_actions, True, node_counter)    
                    if remaining:
                        any_remaining = True

                game_env.load_checkpoint(checkpoint_location, checkpoint_food, checkpoint_path)

            return (None, any_remaining, node_counter)

    def _say(self, text: str):
        print(self.name + ' says: ' + text)

    def start_episode(self, world: EaterWorld) -> Iterable[Eater.Actions]:
        """
        Print the description of the world before starting
        """
        # keep track of the reward
        self.reward = 0

        self._say('Episode starting for player {}'.format(self.name))

        # inspect the objects in the world
        food_locations = []
        agent_start_loc = None
        for o in world.objects:
            if isinstance(o, Eater):
                agent_start_loc = (o.location.x, o.location.y)
                all_actions = list(o.Actions)
            elif isinstance(o, Food):
                food_locations.append((o.location.x, o.location.y))

        # get the list of blocks
        block_locations = sorted((bl.x, bl.y) for bl in world.blocks)

        # Print the description of the world
        self._say('World size: {}x{}'.format(world.size.x, world.size.y))
        self._say('Eater agent in {}'.format(agent_start_loc))
        self._say('Food in {}'.format(sorted(food_locations)))
        self._say('Blocks in {}'.format(block_locations))

        self._say('Available actions: {}'.format({a.name: a.value for a in all_actions}))

        # Initializes the object related to the current game environment and calls the ID search
        game_env = GameEnvironment((world.size.x, world.size.y), agent_start_loc, food_locations, block_locations, all_actions)
        result = self.IDDFS(game_env)

        return result


    def end_episode(self, outcome: int, alive: bool, success: bool):
        """
        Method called at the when an episode is completed
        """
        self._say('Episode completed, my reward is {}'.format(outcome))