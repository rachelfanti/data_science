# AI 2021/2022 - Assignment 1

This folder contains the first assignment for the Artificial Intelligence course of the MSc. in Computational Data Science of the Free University of Bozen-Bolzano

## Team Members

Ceol Samuele, Fanti Coelho Lima Rachel, Hooshyar Hosna

## First setup

The first step required to run this assignment is to create the appropiate Conda environment.
To do so, open the command line, move to the source directory of this project (where the environment.yml file is contained) and run the command:

```conda env create --file environment.yml```

## Running the assignment

Once the environment has been created, activate it by running:

```conda activate aima2021```

Then, move to the search folder (```cd search```) where the code for this first assignment is contained.

Executing the provided pathfinding algorithms on the different worlds is a simple matter of adapting the following command:

```gridrunner --world EaterWorld --entry game_ALG:ALGPlayer --horizon HORIZON ./data/eater-world_NR.json```

In order to switch between the three algorithms, change ```game_ALG:ALGPlayer``` to:

- ```game_ID:IDPlayer``` for executing the Iterative Deepening Depth-First Search algorithm.
- ```game_UCS:UCSPlayer``` for executing the Uniform Cost Search algorithm.
- ```game_AStar:AStarPlayer``` for executing the A-Star algorithm.

In order to change the explored horizon, simply change ```HORIZON``` to an integer value of choice.

Finally, to change the world in which the pathfinding algorithm is executed, change the ```NR``` part of ```./data/eater-world_NR.json``` to an integer value in the range of 0-5.

An example of a complete working command looks as follows:

```gridrunner --world EaterWorld --entry game_AStar:AStar --horizon 30 ./data/eater-world_3.json```

Note that running the A-Star algorithm will prompt the user to select an heuristic of choice before trying to solve the problem at hand.

## Task description

Your task is to implement a player that perform an offline search for a sequence of moves to solve the game and then simply execute them when asked via the play method. In this case the feedback shouldn't be necessary during the game.

Your code must be runnable via the gridrunner script which takes as input the reference to the class implementing the player. By default the script adds the current directory to the Python search path (sys.path) but an alternative path could be added with the --path option. For example the player in examples/eater_usage.py could be run using:

```gridrunner --world EaterWorld --entry eater_usage:GooPlayer --horizon 5 eater-world.json```

In the data directory there are definitions for different worlds, and you should (at least) try your solution with them.

The repository aima-pseudocode contains the description of the algorithms described in the textbook, and you can use it to inspire your coding. The focus here is on understanding how to apply the techniques to our problem rather than being innovative on these standard algorithms.

### Uninformed Search

You should implement code for iterative deepening and uniform cost search, and apply them to the EaterWorld problem. Your code should measure the efficiency of the algorithms in terms of visited nodes in order to compare the different techniques.

### Informed Search

You should implement the *A** algorithm and apply to the EaterWorld problem. Make sure that your implementation can be parametrised by the heuristic function so you can adapt it to different problems. Also in this case your code must be instrumented in order to be capable of measure the number of visited nodes.

In the initial problems there is just one location with food, so as a starting point you can adapt your heuristics to handle this specific case. Problems with an arbitrary number of food locations require more sophisticated heuristics.

## Code structure

In order to propose a solution for this assignment, the code has been organized into two main components.

Firstly, each implementation of the proposed pathfinding algorithms is found in the corresponding ```game_ALG.py``` file (```game_ID.py``` for Iterative Deepening Depth-First Search, ```game_UCS.py``` for Uniform Cost Search and ```game_AStar.py``` for the A-Star algorithm). Within each of these three files, it is possible to find the custom implementation of the ```wumpus.OfflinePlayer``` class (these classes have been called ```IDPlayer```, ```UCSPlayer``` and ```AStarPlayer``` respectively). All the custom implementation of ```wumpus.OfflinePlayer``` contain the ```.start_episode()``` method, from which the appropiate pathfinding algorithm is called.

Secondly, in order to succesfully execute the offline search, a way to simulate changes to the game environment derived from the executed actions is needed. All implementations of the proposed algorithms receive as input a ```GameEnvironment``` object, which is constructed exactly for this purpose. The class related to this object can be found in the ```game_env.py``` file. 

A new ```GameEnvironment``` object is initialized with the following set of variables:
- ```world_size```: A tuple containing the x and y sizes (width and height) of the game environment.
- ```agent_start_loc```: A tuple containing the x and y coordinates for the starting location of the agent.
- ```agent_loc```: A tuple containing the current location of the agent. The initial value of ```agent_loc``` is equal to ```agent_start_loc```.
- ```food_locations```: A list of tuples containing the locations of the food items.
- ```block_items```: A list of tuples containing the locations of the block items.
- ```all_actions```: A dictionary containing the set of available actions, together with their coordinates effects on the agent position.
- ```consumed_food```: A list of tuples containing the food that has already been consumed by the agent. Initialized as an empty list.
- ```agent_path```: A list of actions (having the same format found in ```all_actions```) indicating the set of steps the agent has taken to reach ```agent_loc``` from ```agent_start_loc```. Initialized as an empty list.
- ```path_cost```: Integer value indicating the total cost of the current path from ```agent_start_loc``` to ```agent_loc```.
- ```heuristic```: A value of the enum ```HeuristicApproach``` indicating the heuristic used by the running iteration of the A-Star algorithm. Default value is ```HeuristicApproach.NONE```.
- ```game_status```: A value of the enum ```GameStatus``` indicating if the current game is still running. Default value is ```GameStatus.RUNNING```.

As previously mentioned, the ```game_env.py``` also contains the definition of two enums:
- Enum ```GameStatus```. It contains the statuses of a game instance. Values are:
    1. ```GameStatus.RUNNING```: The current game is still running.
    2. ```GameStatus.OVER```: The current game has been concluded.
- Enum ```HeuristicApproach```. It contains the available heuristics for the A-Star algorithm. Values are:
    1. ```HeuristicApproach.NONE```: No euristic. The algorithms runs like an instance of Uniform Cost Search.
    2. ```HeuristicApproach.MANHATTAN_SUM```: Sum of distances from the current agent location to all food items still present in the environment.
    3. ```HeuristicApproach.MANHATTAN_MIN```: Distance to the closest food item from the current agent location.
    4. ```HeuristicApproach.MANHATTAN_MAX```: Distance to the farthest food item from the current agent location.
    5. ```HeuristicApproach.MANHATTAN_MIN_MAX```: Sum of ```HeuristicApproach.MANHATTAN_MIN``` and ```HeuristicApproach.MANHATTAN_MAX```.
    6. ```HeuristicApproach.MANHATTAN_PATH```: Distance given by iteratively jumping (and summing up the jump costs) from a given food item to the next closest one until all have been consumed. The starting point for the first jump is computed from the agent location.

The set of methods contained in the ```GameEnvironment``` class are as follows:
- ```.get_viable_actions()```: Given the current agent position, computes the set of actions that are not nullified by block items or environment boundaries.
- ```.execute_action()```: Takes as input a given action and executes it on the current enivronemnt. This includes: updating the ```agent_loc``` variable, appending the action to the current ```agent_path```, adding the appropiate value to the ```path_cost```, appending the consumed food items to ```consumed_food``` and checking if the game has been completed.
- ```.check_game_status()```: Updates the ```game_status``` variable based on the current environment configuration.
- ```.reset_game()```: Resets the game to the initial configuration.
- ```.load_checkpoint()```: Accepts a set of checkpoint variables (agent location, consumed food, executed actions and path cost) and sets the game environment accordingly.
- ```.load_path()```: Resets the game environment and executes the path (set of actions) that is passed as input.
- ```.get_heuristic()```: Computes (and returns) the chosen heuristic integer value based on the current environment configuration.

## Algorithms

The solutions proposed in this assignment are relatively straightforward implementation of the corrsesponding algorithms. Therefore, in this README.md a detailed description of the mechanism behind each algorithm won't be included. Some characteristics of the offered implementations that might be worth mentioning are as follows:

- **Iterative Deepening Depth First Search**: 
    - Initial pseudocode source: https://en.wikipedia.org/wiki/Iterative_deepening_depth-first_search
    - From within the ```.start_episode()``` method of the ```IDPlayer``` class, a call to ```.IDDFS()``` is performed. This first method loops through all available path depths until a solution is found. Path depths go from ```0``` to ```(game_env.world_size[0] * game_env.world_size[1]) - len(game_env.block_locations)```, meaning the nr of "walkable" tiles within the current game environment.
    - A recursive implementation of IDDFS has been proposed. The recursive method ```.RDLS()``` is called once per depth value from ```.IDDFS()```. For each available action at a given position, the method performs a recursive call (```self.RDLS(game_env, depth-1, reached_copy, node_counter)```) until the ```depth``` variable reaches the value of ```0``` (i.e. the path has reached the current maximum length).
    - To restore the appropiate game environment configuration after the recursive call, the ```.load_checkpoint()``` method is used.
    - A list of reached state has been added to reduce the number of explored nodes. A state is identified by a given position + the nr of consumed food items. The offered implementation of IDDFS does not re-consider states that have already been reached in the past (and therefore have already been added to the ```reached``` list).
- **Uniform Cost Search**: 
    - Initial pseudocode source: https://github.com/aimacode/aima-pseudocode/blob/master/md/Uniform-Cost-Search.md
    - Each entry in the priority queue used in the offered UCS contains three items (as opposed to the two we would normally expect from such an implementation). The first and third item are naturally the path cost and actions respectively. The second item is a string containing the letters of the action commands (N, E, S & W) for a given path. This string has been added to avoid errors when trying to order paths in the priority queue having the same cost. In the offered version of UCS, the system will firstly order entries by path cost, and then sort entries having the same cost in alphabetical order using the actions string.
    - Once again, this version of UCS uses a ```reached``` dictionary to keep track of the already visited states. In this context, an already visited state (position + consumed food) can be re-visited in the case of a lower path cost.
- **A-Star algorithm**: 
    - The offered implementation of A-Star is fundamentally a one to one match of the UCS one. In this case, the ```.get_heuristic()``` method is used to add the heuristic cost to the canonical path cost.

## Results

### Explored nodes

|          |        |         | **A***    |           |           |               |            |
|----------|--------|---------|-----------|-----------|-----------|---------------|------------|
|          | **ID** | **UCS** | **M_SUM** | **M_MIN** | **M_MAX** | **M_MIN_MAX** | **M_PATH** |
| **W_0**  | 77     | 47      | 16        | 16        | 16        | 16            | 16         |
| **W_1**  | 729    | 102     | 23        | 23        | 23        | 23            | 23         |
| **W_2**  | 10292  | 192     | 40        | 40        | 40        | 40            | 40         |
| **W_3**  |        | 470     | 238       | 289       | 251       | 147           | 132        |
| **W_4**  |        | 5403    | 600       | 3341      | 1825      | 2216          | 1210       |
| **W_5**  |        | 1151    | 3656      | 732       | 1068      | 837           | 1002       |
|          |        |         |           |           |           |               |            |
| **SUM**  |        | 7365    | 4573      | 4441      | 3223      | 3279          | 2423       |
| **MEAN** |        | 2104    | 1307      | 1269      | 921       | 937           | 692        |

### Final reward

|          |        |         | **A***    |           |           |               |            |
|----------|--------|---------|-----------|-----------|-----------|---------------|------------|
|          | **ID** | **UCS** | **M_SUM** | **M_MIN** | **M_MAX** | **M_MIN_MAX** | **M_PATH** |
| **W_0**  | 5      | 5       | 5         | 5         | 5         | 5             | 5          |
| **W_1**  | 2      | 2       | 2         | 2         | 2         | 2             | 2          |
| **W_2**  | -2     | -2      | -2        | -2        | -2        | -2            | -2         |
| **W_3**  |        | 14      | -2        | 14        | 12        | 12            | 12         |
| **W_4**  |        | -23     | -34       | -23       | -23       | -23           | -23        |
| **W_5**  |        | 735     | 533       | 735       | 724       | 731           | 730        |
|          |        |         |           |           |           |               |            |
| **SUM**  |        | 731     | 502       | 731       | 718       | 725           | 724        |
| **MEAN** |        | 122     | 84        | 122       | 120       | 121           | 121        |

### Execution time

|          |          |          | **A***    |           |           |               |            |
|----------|----------|----------|-----------|-----------|-----------|---------------|------------|
|          | **ID**   | **UCS**  | **M_SUM** | **M_MIN** | **M_MAX** | **M_MIN_MAX** | **M_PATH** |
| **W_0**  | 0,006468 | 0,002226 | 0,00719   | 0,004895  | 0,005723  | 0,005877      | 0,003227   |
| **W_1**  | 0,084681 | 0,006457 | 0,005839  | 0,005770  | 0,004930  | 0,005838      | 0,006771   |
| **W_2**  | 1,794352 | 0,013937 | 0,007836  | 0,008995  | 0,010048  | 0,009322      | 0,009857   |
| **W_3**  |          | 0,069001 | 0,077131  | 0,054826  | 0,049688  | 0,033329      | 0,036658   |
| **W_4**  |          | 1,984341 | 0,239911  | 1,062726  | 0,564335  | 0,641406      | 0,422243   |
| **W_5**  |          | 2,096955 | 12,693378 | 1,512199  | 2,372593  | 1,777631      | 8,160900   |
|          |          |          |           |           |           |               |            |
| **SUM**  |          | 4,172917 | 13,031285 | 2,649411  | 3,007317  | 2,473403      | 8,639656   |
| **MEAN** |          | 0,695486 | 2,171881  | 0,441569  | 0,501220  | 0,412234      | 1,439943   |