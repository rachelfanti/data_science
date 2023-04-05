import wumpus as wws

from typing import Iterable, Union
from game_env import GameEnvironment


class CustomPlayer(wws.OnlinePlayer):
    def __init__(self, name: str = None, truth_threshold = 0.8):
        self._name = str(name) if name is not None else wws.gridworld.object_id(self)
        self.truth_threshold = truth_threshold

    def start_episode(self):
        self.game_env = GameEnvironment(truth_threshold = self.truth_threshold)

    def play(self, percept: wws.Percept, actions: Iterable[wws.Agent.Actions], reward: Union[int, None]) -> wws.Agent.Actions:
        '''
        Given a percept, which might differ according to the specific problem, and the list of valid actions, returns an action to play at the given turn or None to stop the episode. 
        The reward is the one obtained in the previous action, on the first turn its value is None.
        '''
        return self.game_env.get_action(percept.__str__())

