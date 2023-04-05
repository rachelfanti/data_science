# Register the Wumpus world environment
import itertools, random, copy, enum
import numpy as np
import pandas as pd

from gym_wumpus.envs import WumpusEnv
from wumpus import Hunter
from game_env import GameEnvironment
from collections import namedtuple

EpsilonJump = namedtuple("EpsilonJump", "EPISODE_PERC INITIAL_E FINAL_E")

class ExplorationApproach(enum.Enum):
    RANDOM = 1
    GREEDY = 2
    EPSILON_GREEDY = 3
    DECAYING_EPSILON_GREEDY = 4
    EPSILON_JUMP = 5

class BinaryStates(enum.Enum):
    BASIC = ['gold_taken']
    ADVANCED = ['gold_taken', 'wumpus_killed']
    COMPLETE = ['gold_taken', 'wumpus_killed', 'climbed_out']

class GymCustomPlayer(object):
    MAX_ENV_SIZE = (8, 8)

    def __init__(self, gym_Env, bin_states, expl_approach, epsilon_jump = EpsilonJump(0.8, 0.9, 0.01), grab_reward = True):
        self.bin_states = bin_states
        self.gym_Env = gym_Env
        self.q_table = np.zeros([
            self.MAX_ENV_SIZE[0] * self.MAX_ENV_SIZE[1] * len(Hunter.Orientation) * (2 ** len(self.bin_states.value)),
            gym_Env.action_space.n
        ])

        state_ranges = [range(i) for i in self.MAX_ENV_SIZE] + [range(len(Hunter.Orientation))] + [range(2) for i in self.bin_states.value]
        state_list = list(itertools.product(*state_ranges))
        self.state_dict = dict(zip(state_list, range(len(state_list))))

        self.grab_reward = grab_reward

        self.expl_approach = expl_approach
        self.epsilon_jump = epsilon_jump

    def run_episode(self, gym_Env: WumpusEnv):
        '''
        Runs one episode in the specified game environment by selecting the best action for a given state from the Q-table built during training
        '''
        gameEnv = GameEnvironment(grab_reward=self.grab_reward)
        state_idx = self.get_state_index(gameEnv)
        cframes = []

        obs = self.gym_Env.reset()
        total_reward = 0

        while True:
            cframes.append(gym_Env.render('ansi'))

            action = int(np.argmax(self.q_table[state_idx]))   # Take best action according to Q-Table
            new_obs, reward, done, info = self.gym_Env.step(action)
            gameEnv.execute_action(Hunter.Actions(action), obs, new_obs)
            
            total_reward += reward
            obs = new_obs
            state_idx = self.get_state_index(gameEnv)
            
            if done:
                break

        self.gym_Env.close()
        return total_reward, cframes

    def train(self, episodes: int, alpha=0.1, gamma=0.6, epsilon=0.9, epsilon_decay=0.01, epsilon_min=0.01):
        '''
        Updates the Q-Table values using the selected exploration approach for the specified amount of episodes
        '''
        gameEnv = GameEnvironment(grab_reward=self.grab_reward)
        rewards = []
        epsilon_curr = epsilon

        for episode in range(episodes):
            gameEnv.reset_game()
            obs = self.gym_Env.reset()
            ep_reward = 0

            prev_state_idx = self.get_state_index(gameEnv)

            while True:
                
                if self.expl_approach == ExplorationApproach.RANDOM:
                    action = self.gym_Env.action_space.sample() 
                if self.expl_approach == ExplorationApproach.GREEDY:
                    action = int(np.argmax(self.q_table[prev_state_idx]))  
                elif self.expl_approach == ExplorationApproach.EPSILON_GREEDY:
                    if random.uniform(0, 1) < epsilon:
                        action = self.gym_Env.action_space.sample() 
                    else:
                        action = int(np.argmax(self.q_table[prev_state_idx]))   
                elif self.expl_approach == ExplorationApproach.DECAYING_EPSILON_GREEDY:
                    if random.uniform(0, 1) < epsilon_curr:
                        action = self.gym_Env.action_space.sample() 
                    else:
                        action = int(np.argmax(self.q_table[prev_state_idx]))
                else:
                    if episode/episodes < self.epsilon_jump.EPISODE_PERC: # Favor exploration
                        if random.uniform(0, 1) < self.epsilon_jump.INITIAL_E:
                            action = self.gym_Env.action_space.sample() 
                        else:
                            action = int(np.argmax(self.q_table[prev_state_idx]))
                    else: # Favor exploitation
                        if random.uniform(0, 1) < self.epsilon_jump.FINAL_E:
                            action = self.gym_Env.action_space.sample() 
                        else:
                            action = int(np.argmax(self.q_table[prev_state_idx]))

                new_obs, r, done, info = self.gym_Env.step(action)
                r += gameEnv.execute_action(Hunter.Actions(action), obs, new_obs)
                
                ep_reward += r

                # Update q-table
                curr_state_idx = self.get_state_index(gameEnv)
                self.q_table[prev_state_idx, action] = (1 - alpha) * self.q_table[prev_state_idx, action] + alpha * (r + gamma * np.max(self.q_table[curr_state_idx]))
                
                obs = copy.deepcopy(new_obs)
                prev_state_idx = copy.deepcopy(curr_state_idx)

                if done: 
                    epsilon_curr = epsilon_min + (epsilon - epsilon_min) * np.exp(-epsilon_decay * episode)
                    rewards.append(ep_reward)
                    break

        self.gym_Env.close()
        return self.q_table, rewards

    def get_state_index(self, gameEnv):
        '''
        Given a game environment object, retrieves the Q-Table index corresponding to the current state
        '''
        curr_state = gameEnv.agent_loc
        curr_state += (list(Hunter.Orientation).index(gameEnv.agent_orientation),)
        for state_var in self.bin_states.value: curr_state += (int(gameEnv.__dict__[state_var]),)
        return self.state_dict[curr_state] 

    def print_q_table(self, print_null = False):
        states = [i for i in self.MAX_ENV_SIZE] + [len(Hunter.Orientation)] + [2 for _ in self.bin_states.value]
        state_ranges = [range(i) for i in states]
        state_list = list(itertools.product(*state_ranges))

        df = pd.DataFrame(self.q_table, columns=['MOVE','RIGHT','LEFT','SHOOT','GRAB','CLIMB'])
        df.index = state_list

        pd.set_option('display.max_rows', 20)
        if print_null: return df
        else: return df.loc[~(df==0).all(axis=1)]