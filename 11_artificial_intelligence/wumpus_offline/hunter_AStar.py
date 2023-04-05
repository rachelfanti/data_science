import queue
import time, math
from typing import Iterable
from queue import PriorityQueue
from collections import namedtuple

import wumpus as wws
from game_env import GameEnvironment, GameStatus, HeuristicApproach

QueueItem = namedtuple("QueueItem", "COST HEURISTIC ID PATH") # Heuristic added for tie breaking
Solution = namedtuple("Solution", "COST PATH")

class AStarPlayer(wws.OfflinePlayer):
    """
    Offline player using the uniform cost search
    """
    def AStar(self, game_env):
        '''
        Starts the computation for the Uniform Cost Search
        Starting point for code taken from ./search/game_UCS.py (Lab01)
        '''
        def print_results(solution, node_counter, exec_time):
            print("---------- RESULT ---------")
            print(f"The algorithm has explored {node_counter} node(s)")
            print(f"Search was completed in {exec_time} seconds")
            if solution.COST + game_env.WIN_COST >= GameEnvironment.ACTIONS_COST[wws.Hunter.Actions.CLIMB]:
                print("Found solution is more expensive than just climbing out.")
                path = [wws.Hunter.Actions.CLIMB]
            elif solution.PATH == []:
                print("No viable solution was found! Climbing out")
                path = [wws.Hunter.Actions.CLIMB]
            else:
                print("Found solution: ")
                print(solution.PATH)
                path = solution.PATH
            print("---------------------------")
            return path

        game_env.reset_game()
        start_time = time.time()
        node_counter = 1

        # Check for impossible game via heuristic
        if game_env.get_heuristic() == -1: return print_results(Solution(0, []), node_counter, round(time.time() - start_time, 6))

        priority_queue = PriorityQueue()
        priority_queue.put(QueueItem(game_env.get_heuristic(), game_env.get_heuristic(), None, None)) # Root node

        reached = {} # Key is node coordinates, wumpus status (killed/not killed) and gold status (taken/not taken). Value is lowest cost found to reach the state
        solution = Solution(math.inf, []) # Solution cost and path
        
        while not priority_queue.empty():
            queue_item = priority_queue.get()

            if solution.PATH and (solution.COST <= queue_item.COST):
                break

            game_env.load_path(queue_item.PATH)

            for direction in game_env.get_viable_directions():
                initial_path_length = len(game_env.agent_path)
                game_env.execute_direction(direction)
                node_counter += len(game_env.agent_path) - initial_path_length
                
                # We add the path to the queue only if it's the first time we reach the target node or if the current path is cheaper 
                # than the previously found one (given the same configuration)
                stored_cost = reached.get((game_env.agent_loc, game_env.killed_wumpus, game_env.taken_gold))

                if (stored_cost is None) or (game_env.path_cost + game_env.get_heuristic() < stored_cost):
                    reached[(game_env.agent_loc, game_env.killed_wumpus, game_env.taken_gold)] = game_env.path_cost + game_env.get_heuristic()

                    if game_env.check_game_status() == GameStatus.OVER:
                        # Make sure that current solution is cheaper than the previously stored one
                        if game_env.path_cost < solution.COST: solution = Solution(game_env.path_cost, game_env.agent_path)
                    # Items are put back in the priority queue only if they are not complete solutions
                    else:
                        # The string generated for the ID element avoids error when ordering paths with the same cost
                        priority_queue.put(QueueItem(game_env.path_cost + game_env.get_heuristic(), game_env.get_heuristic(), ' '.join(e.name for e in game_env.agent_path), game_env.agent_path)) 

                game_env.load_path(queue_item.PATH)

        return print_results(solution, node_counter, round(time.time() - start_time, 6))


    def start_episode(self, world: wws.WumpusWorld) -> Iterable[wws.Hunter.Actions]:
        """Print the description of the world before starting."""

        world_info = {k: [] for k in ('Hunter', 'Pits', 'Wumpus', 'Gold', 'Exits')}
        world_info['Size'] = (world.size.x, world.size.y)
        world_info['Blocks'] = [(c.x, c.y) for c in world.blocks]

        for obj in world.objects:
            if isinstance(obj, wws.Hunter):
                world_info['Hunter'].append((obj.location.x, obj.location.y))
                all_actions = list(obj.Actions)
            elif isinstance(obj, wws.Pit):
                world_info['Pits'].append((obj.location.x, obj.location.y))
            elif isinstance(obj, wws.Wumpus):
                world_info['Wumpus'].append((obj.location.x, obj.location.y))
            elif isinstance(obj, wws.Exit):
                world_info['Exits'].append((obj.location.x, obj.location.y))
            elif isinstance(obj, wws.Gold):
                world_info['Gold'].append((obj.location.x, obj.location.y))

        print('World details:')
        for k in ('Size', 'Pits', 'Wumpus', 'Gold', 'Exits', 'Blocks'):
            print('  {}: {}'.format(k, world_info.get(k, None)))

        print([e.name for e in wws.Hunter.Actions])

        while True:
            print("Insert the corresponding number and press ENTER to choose an heuristic:")
            count = 1
            for heuristic in HeuristicApproach:
                print(f"\t{count}: {heuristic.name}")
                count +=1

            answer = int(input('Input: ').strip())
            if answer in HeuristicApproach._value2member_map_:
                chosen_heuristic = HeuristicApproach(answer)
                break
            else:
                print("Please enter a valid choice")
                print("---------------------------")

        game_env = GameEnvironment((world.size.x, world.size.y), world_info.get('Gold')[0], world_info.get('Wumpus')[0], world_info.get('Pits'), chosen_heuristic)
        result = self.AStar(game_env)

        return result




