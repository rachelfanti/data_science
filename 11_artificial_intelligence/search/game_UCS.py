import time
from typing import Iterable
from queue import PriorityQueue
from collections import namedtuple

from wumpus import OfflinePlayer, Eater, EaterWorld, Food
from game_env import GameEnvironment, GameStatus

QueueItem = namedtuple("QueueItem", "COST ID PATH")
Solution = namedtuple("Solution", "COST PATH")

class UCSPlayer(OfflinePlayer):
    """
    Offline player using the uniform cost search
    """
    def UCS(self, game_env):
        '''
        Starts the computation for the Uniform Cost Search
        Starting point for algorithm pseudocode from: https://algorithmicthoughts.wordpress.com/2012/12/15/artificial-intelligence-uniform-cost-searchucs/
        And idea for 'reached' dictionary from: https://github.com/aimacode/aima-pseudocode/blob/master/md/Uniform-Cost-Search.md
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

        game_env.reset_game()
        start_time = time.time()
        node_counter = 1

        priority_queue = PriorityQueue()
        priority_queue.put(QueueItem(0, None, None)) # Root node. No action & cost = 0

        reached = {} # Key is node coordinates and consumed food. Value is lowest cost found to reach the node
        solution = Solution(0, []) # Solution cost and path
        
        while not priority_queue.empty():
            queue_item = priority_queue.get()

            if solution.PATH and (solution.COST <= queue_item.COST):
                break

            game_env.load_path(queue_item.PATH)

            for action in game_env.get_viable_actions():
                node_counter += 1
                game_env.execute_action(action)
                
                # We add the path to the queue only if it's the first time we reach the target node or if the current path is cheaper 
                # than the previously found one (given the same food configuration)
                stored_cost = reached.get((game_env.agent_loc, tuple(game_env.consumed_food)))

                if (stored_cost is None) or (game_env.path_cost < stored_cost):
                    reached[(game_env.agent_loc, tuple(game_env.consumed_food))] = game_env.path_cost

                    # The string generated for the ID element avoids error when ordering paths with the same cost
                    priority_queue.put(QueueItem(game_env.path_cost, ''.join(e.name for e in game_env.agent_path), game_env.agent_path)) 

                    if game_env.check_game_status() == GameStatus.OVER:
                        solution = Solution(game_env.path_cost, game_env.agent_path)

                game_env.load_path(queue_item.PATH)

        return print_results(solution.PATH, node_counter, round(time.time() - start_time, 6))

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

        # TODO: Custom algorithm should be implemented here
        # Initializes the object related to the current game environment and calls the ID search
        game_env = GameEnvironment((world.size.x, world.size.y), agent_start_loc, food_locations, block_locations, all_actions)
        result = self.UCS(game_env)

        return result


    def end_episode(self, outcome: int, alive: bool, success: bool):
        """
        Method called at the when an episode is completed
        """
        self._say('Episode completed, my reward is {}'.format(outcome))