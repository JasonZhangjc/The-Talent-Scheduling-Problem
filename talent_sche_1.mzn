% The Talent Scheduling Problem
include "alldifferent.mzn";

% Parameters
array[int] of int: scenesLength;              % in data file
array[int] of int: actorsCosts;               % in data file
int: ns = length(scenesLength);               % number of scenes
int: na = length(actorsCosts);                % number of actors
array[1..na] of set of 1..ns: actorsToScenes; % in data file

% Variables
array[1..ns] of var 1..ns: order;        % main variables
      % order[1]=5 means the scene 1 is the fifth scene to be shot.
             
array[1..na] of var 1..ns: first_scene;  
      % The "order[] value" of the earliest scene to be shot in an actor's list
      
array[1..na] of var 1..ns: last_scene;   
      % The "order[] value" of the latest scene to be shot in an actor's list
      
array[1..na] of var int: wait_time;      % waiting time for each actor

array[1..ns] of var 1..ns: inv_idx;      
      % the "inverse" array of order[], will be used in the main constraint
      
var int: total_cost;

% Constraints:
constraint alldifferent([order[i] | i in 1..ns]);        
      % order[i] should be all-diff for each i
      
constraint forall(i in 1..ns)(order[inv_idx[i]] == i);   
      % if order[i]=j, then inv_idx[j]=i

constraint forall(i in 1..na)
(first_scene[i] == min([order[j] | j in actorsToScenes[i]])); %first to be first
           
constraint forall(i in 1..na)
(last_scene[i] == max([order[j] | j in actorsToScenes[i]]));  % last to be last

constraint forall(i in 1..na)(wait_time[i] == 
                              sum(j in first_scene[i]..last_scene[i])
                                 (if exists(k in actorsToScenes[i])(order[k]==j) then 0 
                                  else scenesLength[inv_idx[j]]  endif));
	  % Main constraint
	  % For each actor, from its first_scene to the last_scene, if any scene 
	  % that the actor doesn't attend occurs between these two scenes,
	  % add the duration time of this scene to the actor's waiting time

constraint total_cost == sum(i in 1..na)(wait_time[i] * actorsCosts[i]); 
      % total_cost for optimization

% Obj
solve minimize total_cost;
