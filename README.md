# PrologGoalNodes
Small Prolog exercise looking at the arc predicate and Seeds.


Suppose a positive integer ```Seed``` links nodes ```1,2,...``` in two ways:
```
arc(N,M,Seed) :- M is N*Seed.
arc(N,M,Seed) :- M is N*Seeed +1.
```
e.g. ```Seed=3``` gives ```arcs``` ```(1,3), (1,4), (3,9), (3,10),...```


Goal nodes are multiples of a positive integer ```Target```  
```
goal(N,Target) :- 0 is N mod Target
```

e.g. ```Target=13``` gives ```goals``` ```13,26,39,...```


Modify frontier search to define the predicates:
```
breadth1st(+Start, ?Found, +Seed, +Target)
depth1st(+Start, ?Found, +Seed, +Target)
```
that will search breadth-first and depth-first respectively for a ```Target```-goal node ```Found``` linked to ```Start``` by ```Seed```-arcs

So we start with a particular node called ```Start``` and then we keep searching until we find the goal node ```Found```. We assume that ```Seed``` and ```Target``` are specified. 

The plus means these are instantiated. So ```Start``` could be instantiated to 1, ```Seed``` could be instantiated to 3 and the ```Target``` could be instantiated to 13. And we are trying to find ```Found``` using breadth-first and depth-first modified frontier searches.


See exercise.pl
