# Minizinc models of The Talent Scheduling Problem
This is a demo of an Minizinc model for The Talent Scheduling Problem in CSPLib (http://www.csplib.org/Problems/prob039/). This model can be used when the scenes that each actor attends are not in a binary format.

Required tools:
 1. Minizinc (https://www.minizinc.org/)
 
To build the project:
 1. Create a new project in Minizinc IDE and include the required .mzn as your model and the .dzn as your input data file.
 2. Run model with data.
 3. Or you can use the command line.
 
Which model to use:
 1. For solving the Film2 and the Rehearsal_Smith, or any other problems that the indices of scenes start from 1, please use the talent_sche_1.mzn.
 2. For solving the input_10_8_5_4 and the input_11_9_6_5, or any other problems that the indices of scenes start from 0, please use the talent_sche_0.mzn.

Take the rehearsal_Smith scheduling problem (a very similar problem to The Talent Scheduling Problem) as an example:</br>

Scene----	1	2	3	4	5	6	7	8	9  Cost</br>
Actor 1--	1	1	0	1	0	1	1	0	1  1</br>
Actor 2--	1	1	0	1	1	1	0	1	0  1</br>
Actor 3--	1	1	0	0	0	0	1	1	0  1</br>
Actor 4--	1	0	0	0	1	1	0	0	1  1</br>
Actor 5--	0	0	1	0	1	1	1	1	0  1</br>
Duration	2	4	1	3	3	2	5	7	6  1</br>

This example is given in a binary format, we need to transform it into an integer format as follows:</br>

scenesLength = [2,4,1,3,3,2,5,7,6];</br>
actorsCosts = [1,1,1,1,1];</br>
actorsToScenes = </br>
[{1,2,4,6,7,9}, {1,2,4,5,6,8}, {1,2,7,8}, {1,5,6,9}, {3,5,6,7,8}];</br>

Use rehearsal_Smith.dzn as the data file and talent_sche_1.mzn as the model, you may get the following results:</br>

...</br>
...</br>
...</br>
order = array1d(1..9, [5, 6, 9, 2, 4, 3, 7, 8, 1]);</br>
first_scene = array1d(1..5, [1, 2, 5, 1, 3]);</br>
last_scene = array1d(1..5, [7, 8, 8, 5, 9]);</br>
wait_time = array1d(1..5, [3, 5, 0, 3, 6]);</br>
inv_idx = array1d(1..9, [9, 4, 6, 5, 1, 2, 7, 8, 3]);</br>
total_cost = 17;</br>
----------</br>
==========</br>

The total_cost 17 is the same as the optimal cost on http://www.csplib.org/Problems/prob039/.</br>


