import enum

from wumpus import Hunter

class GameEnvironment(object):
    START_LOC = (0, 0)

    def __init__(self, grab_reward):
        self.agent_loc = self.START_LOC
        self.agent_orientation = Hunter.Orientation.N
        self.wumpus_killed = False
        self.gold_taken = False
        self.climbed_out = False

        self.grab_reward = grab_reward

    def execute_action(self, action, old_obs, new_obs):
        '''
        Updates the appropriate environment variables based on the pivot, move, or shoot action passed as a parameter
        '''
        additional_reward = 0

        if new_obs['scream'] == 1: self.wumpus_killed = True

        if action == Hunter.Actions.MOVE and new_obs['bump'] == 0:
            self.agent_loc = tuple(map(sum,zip(self.agent_loc, self.agent_orientation.value)))
        elif action == Hunter.Actions.LEFT:
            self.agent_orientation = Hunter.ROT_LEFT[self.agent_orientation]
        elif action == Hunter.Actions.RIGHT:
            self.agent_orientation = Hunter.ROT_RIGHT[self.agent_orientation]
        elif action == Hunter.Actions.GRAB and old_obs['glitter'] == 1:
            if self.grab_reward: additional_reward += 1000
            self.gold_taken = True
        elif action == Hunter.Actions.CLIMB and self.agent_loc == self.START_LOC:
            self.climbed_out = True

        return additional_reward

    def reset_game(self):
        self.__init__(self.grab_reward)