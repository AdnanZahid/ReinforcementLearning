# ReinforcementLearning

This is a simple Reinforcement Learning project written in Swift.

Basically, it navigates around a grid to find the goal (without knowing it before hand). Then it constructs an optimal path to the goal using Q-learning.

Here's a visual representation which demonstrates the navigation:

1. **_Dark green_** color represents the **_success node_** (or goal)
2. **_Dark red_** color represents the **_failure node_** (or anti-goal)
3. **_Light green_** color represents the **_Q-value_** (according to scale)

![Visual representation](https://github.com/AdnanZahid/ReinforcementLearning/blob/master/Example.png)

Please see the following files for more information:

1. [QLearning.swift](https://github.com/AdnanZahid/ReinforcementLearning/blob/master/ReinforcementLearning/QLearning.swift)
2. [AISolver.swift](https://github.com/AdnanZahid/ReinforcementLearning/blob/master/ReinforcementLearning/AISolver.swift)
