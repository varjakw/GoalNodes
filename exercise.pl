%-------------------Breadth First---------------------------
breadth1st(Start, Found, Seed, Target) :- fsB([Start], Found, Seed, Target).
% starting from Start and trying to find a multiple of Target. We are returning the Found node; the first node we find.
% frontier search breadthfirst. Go from  node to list of nodes. Start to [Start]


fsB([Node|_], Node, _, Target) :- goal(Node, Target).
% Then here we have the list of candidate goal nodes ([Node|_]) and we are always looking at the head
% check if head is a goal node

fsB([Node|Rest], Found, Seed, Target) :- 
              findall(Next, arc(Node, Next, Seed), Children),
              append(Rest, Children, NewF),
              fsB(NewF, Found, Seed, Target).
% for breadth first, the add2frontier will just append the rest of the frontier here to the Children of the node.
% the children come after the rest of the frontier (the siblings of the node)

%?- breadth1st(1,F,3,13)
% F = 13 ?  ;
% F = 39 ?  ;

%------------------Depth First------------------------------
depth1st(Start, Found, Seed, Target) :- fsB([Start], Found, Seed, Target).
fsD([Node|_], Node, _, Target) :- goal(Node, Target).

fsD([Node|Rest], Found, Seed, Target) :- 
                findall(Next, arc(Node, Next, Seed), Children),
                append(Children, Rest, NewF),  % note this line is different
                fsD(NewF, Found, Seed, Target)
