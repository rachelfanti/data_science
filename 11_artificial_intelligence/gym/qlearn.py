#!/usr/bin/env python

"""Helper code for Q-Learning"""


from dataclasses import dataclass
import sys
from typing import Any, Iterable, Sequence, Tuple, Union

import gym
import matplotlib.pyplot as plt
from matplotlib.animation import FuncAnimation
import numpy as np
import pandas as pd
from PIL import Image
from tensorflow import keras

@dataclass
class EpResult:
    reward: float
    frames: Union[Sequence[Any], None] = None


class QTable(object):
    """Abstract class for Q-tables."""

    def update(self, obs, action, value: float) -> None:
        raise NotImplementedError

    def policy(self, obs) -> Any:
        raise NotImplementedError

    def expected(self, obs, action = None) -> float:
        raise NotImplementedError


class DiscreteQTable(QTable):
    """QTable for discrete observation and action spaces."""
    def __init__(self, env: gym.Env, value: Union[float, Tuple[float, float]] = 0.0):
        obs_size = env.observation_space.n
        act_size = env.action_space.n
        if isinstance(value, (int, float)):
            self._table = np.full((obs_size, act_size), value)
        else:
            self._table = np.random.uniform(low=value[0], high=value[1], size=(obs_size, act_size))

    def update(self, obs: int, action: int, value: float) -> None:
        self._table[obs, action] = value

    def expected(self, obs: int, action: int = None) -> float:
        if action is None:
            return np.max(self._table[obs])
        else:
            return self._table[obs, action]

    def policy(self, obs):
        return np.argmax(self._table[obs])


class DeepQTableSeq(QTable):
    """Q-table using a sequential deep network. Requires discrete action spaces and observation spaces supporting the shape method (Numpy ndarray)."""
    def __init__(self, env: gym.Env, model: keras.Sequential=None, layers: int=4, units: int=24, learning_rate: float=0.001, epochs: int=1):
        if model is None:
            self._model = self._deep_model(env, layers=layers, units=units, learning_rate=learning_rate)
        else:
            if not self._check_model(env, model):
                raise RuntimeError(f'Keras model {model} cannot be used for gym environment {env}')
            self._model = model
        self._epochs = epochs

    @property
    def model(self) -> keras.Model:
        """The keras model approximating the Q-table."""
        return self._model

    def expected(self, obs: np.ndarray, action: int = None) -> float:
        if action is None:
            return np.max(self.model.predict(np.array([obs]))[0])
        else:
            return self.model.predict(np.array([obs]))[0][action]

    def policy(self, obs: np.ndarray) -> int:
        return np.argmax(self.model.predict(np.array([obs]))[0])

    def update(self, obs: np.ndarray, action: int, value: float) -> None:
        targets = self.model.predict(np.array([obs]))[0]
        targets[action] = value
        self.model.fit(np.array([obs]), np.array([targets]), epochs=self._epochs, verbose=0)

    @staticmethod
    def _check_model(env: gym.Env, model: keras.Sequential) -> bool:
        try:
            assert model.layers[-1].output_shape[1] == env.action_space.n
            assert model.layers[0].input_shape[1:] == env.observation_space.shape
            return True
        except Exception:
            return False

    @staticmethod
    def _deep_model(env: gym.Env, layers=4, units=24, learning_rate=0.001) -> keras.Sequential:
        input_shape = env.observation_space.shape
        output_size = env.action_space.n

        model = keras.Sequential()
        model.add(keras.Input(shape=input_shape))
        k_init = keras.initializers.he_uniform()
        for _ in range(max(layers - 1, 0)):
            model.add(keras.layers.Dense(units=units, activation='relu', kernel_initializer=k_init))
        model.add(keras.layers.Dense(units=output_size, activation='linear', kernel_initializer=k_init))

        model.compile(
            loss='mse',
            optimizer=keras.optimizers.Adam(lr=learning_rate))

        return model


def run_episode(env: gym.Env, qtable: QTable = None, frames: str = None) -> EpResult:
    reward = 0
    cframes = [] if frames in env.metadata.get('render.modes', []) else None

    obs = env.reset()

    while True:
        if cframes is not None:
            cframes.append(env.render(frames))

        action = env.action_space.sample() if qtable is None else qtable.policy(obs)
        obs, r, done, info = env.step(action)
        reward += r
        if done:
            if cframes is not None:
                cframes.append(env.render(frames))
            break

    env.close()

    return EpResult(reward=reward, frames=cframes)


def plot_rewards(rewards: Iterable[float], ax: plt.Axes = None):
    """Creates a plot showing the training history of the given list of rewards.
    Returns the axes in which the plot has been created.
    """
    rews = np.array(rewards).T
    # calculate the running average <https://stackoverflow.com/a/30141358>
    smoothed_rews = pd.Series(rews).rolling(max(1, int(len(rews) * .01))).mean()

    ax = ax if ax is not None else plt.axes()

    ax.plot(smoothed_rews)
    ax.plot([np.mean(rews)] * len(rews), label='Mean', linestyle='--')
    ax.plot(rews, color='grey', alpha=0.3)
    ax.set_xlabel('Episode')
    ax.set_ylabel('Total Reward')

    return ax


def frames_to_animation(frames: Iterable[np.ndarray], fig: plt.Figure = None) -> FuncAnimation:
    """Creates a new animation with the list of bitmats in `frames` within the given figure, returning
    the animation.
    If no figure is specified, a new one will be created.
    """
    fig = fig if fig is not None else plt.figure()
    ax = fig.add_subplot(1, 1, 1)
    ax.axis('off')

    images = [Image.fromarray(f) for f in frames]

    return FuncAnimation(
        fig, (lambda i: [ax.imshow(i)]),
        frames=images, interval=50, blit=True, repeat=False)



def basic_training(env: gym.Env, qtable: QTable, episodes: int,
    alpha=0.1, gamma=0.6,
    epsilon=0.1, epsilon_decay=0, epsilon_min=0.01,
    verbose: bool=False) -> Iterable[float]:
    rewards = []
    epsilon_c = epsilon

    for episode in range(episodes):
        obs = env.reset()
        ep_reward = 0
        random_count = 0
        while True:
            if epsilon_c > np.random.random():
                action = env.action_space.sample()
                random_count += 1
            else:
                action = qtable.policy(obs)

            new_obs, r, done, info = env.step(action)
            ep_reward += r

            exp_reward = (1 - alpha) * qtable.expected(obs, action) + alpha * (r + gamma * qtable.expected(new_obs))
            qtable.update(obs, action, exp_reward)

            obs = new_obs
            if done:
                if verbose:
                    print(f'Episode {episode}/episodes: reward {ep_reward}, random actions {random_count}, epsilon {epsilon}')
                epsilon_c = epsilon_min + (epsilon - epsilon_min) * np.exp(-epsilon_decay * episode)
                rewards.append(ep_reward)
                break

    env.close()
    return rewards

def main(*carg: str):

    env = gym.make('FrozenLake-v1')
    print(env.metadata)

    result = run_episode(env=env, frames='ansi')
    for f in result.frames or []:
        print(f)
    print(f'Total reward: {result.reward}')
    return 0


if __name__ == "__main__":
    sys.exit(main(*sys.argv[1:]))