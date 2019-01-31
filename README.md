# Find all forcible paths between the src and the dst
This is a demo of an Minizinc model for The Talent Scheduling Problem in CSPLib (http://www.csplib.org/Problems/prob039/). This model can be used when the scenes that each actor attends are not in a binary format.

Required tools:
 1. Minizinc (https://www.minizinc.org/)
 
To build the project:
 1. Create a new project in Minizinc IDE and include the required .mzn as your model and the .dzn as your input data file.
 2. Run model with data.
 3. Or you can use the command line.

Take Film2 as an example:


Day*****	1	2	3	4	5	6	7	8	9	10	11	12	13	Cost/100
Actor 01	0	0	1	0	0	0	0	0	1	1	1	1	0	40
Actor 02	1	1	0	0	1	1	1	1	1	1	1	0	1	20
Actor 03	0	1	0	0	0	0	0	1	0	0	0	0	0	20
Actor 04	1	0	0	1	1	1	1	1	1	1	0	0	1	10
Actor 05	0	0	0	1	0	0	0	0	0	1	0	0	0	5
Actor 06	1	0	0	0	0	1	1	0	1	1	1	1	0	10
Actor 07	0	1	0	0	1	0	0	0	1	1	1	0	0	5
Actor 08	0	0	0	0	0	1	0	0	0	1	0	0	0	4
Actor 09	0	0	0	0	0	0	0	0	0	0	1	0	1	5
Actor 10 	0	0	0	0	0	0	0	0	1	1	0	0	0	4
Duration	1	1	1	1	3	1	1	1	1	1	1	1	1


 
For the graph stored in input.dat</br>
For example:</br>

0,1,2</br>
1,2</br>
2,3,4</br>
3,1,5</br>
4,5</br>
5</br>

The graph is stored in linked_list format.</br>
It means that the node 0 has two edges from it. One edge points to node 1 and the other edge points to node 2.</br>
The node 1 has only one edge from it. The edge points to node 2.</br>
...</br>
The node 5 has no edge from it.</br>

As a result, if we select 0 as the source and 5 as the destination, there are four paths in total:</br>
Found a forcible path: ->0->1->2->3->5</br>
Found a forcible path: ->0->1->2->4->5</br>
Found a forcible path: ->0->2->3->5</br>
Found a forcible path: ->0->2->4->5</br>
