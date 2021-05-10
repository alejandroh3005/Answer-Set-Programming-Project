

% When we instantiate "a", we are telling the solver that a is true. 

%This is a condition. This can be read as "if b is true, then so is a"
%a :- b.

%If we do not have a "head" to our condition, this will be known as a constraint.
%a constraint will always make the condition of the right false. Essentially what this does, is that it eliminates unwanted solution candidates  
%:- b

%Here we have a choice rule. A choice rule's purpose is to provide choices over subsets of atoms
%{a,b}.


%This choice rule can be read as " 'a' MAY be in an aswer set" (it might or might not be)
{a}. %when we run, we can get two solutions. Solution1: " " or Solution2: "a"

%we also have normal rules, 
%this reads as: "if a is in the answer set(true), the b must also be in the aswer set(true)/we must add b to the answer set
b :- a. %when we run, we can get two solutions like previously, just that Solution2 is now : "a b"

%constraint rules (constraints the answer set that we may have)
%"it cannot be the case that b is in the answer set" (delete an aswer set if b is not in it)
:- b.
