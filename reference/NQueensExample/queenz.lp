%Author: Ricardo Baeza
%Reference: https://www.youtube.com/watch?v=EnLHTnAIiss&t=983s

%Defining fields: row & column
row(1..n). %this defines the field with n amount of rows
col(1..n). %this defines the field with n amount of columns
%^ to run we use clingo queenz.lp --const n=x y : x = any positive int, y = how many solutions you want to be output

%Now we need poulate, which means we are going to place queens onto the board
{ queen(I,J) : row(I), col(J) }. %our generator is this choice rule

%we will use integrity constraints in order to make restrictions on output
:- { queen(I,J) } != n. %this condition makes sure that exactly n queens are displayed on the board

%based on the previous output ^, the queens are still able to attack eachother, so we will have to add more integrity constraints
%these two tell the computer that it is not allowed to have a queen on the same line or same row as another queen 
:- queen(I,J), queen(I,J'), J != J'.
:- queen(I,J), queen(I',J), I != I'.

%Now... we need to make sure that no queens is across from another queen
%these constrainst will ensure diagonal attacks on queens
:- queen(I,J), queen(I',J'), (I,J) != (I',J'), I-J == I'-J'.
:- queen(I,J), queen(I',J'), (I,J) != (I',J'), I+J == I'+J'.
%Now, we should get what we are hoping for based on our constraints
%the output we get is: Answer: 1 (visualization shown on vertical&horizontalremoved.jpeg)
%row(1) row(2) row(3) row(4) row(5) col(1) col(2) col(3) col(4) col(5) queen(1,5) queen(2,2) queen(3,4) queen(4,1) queen(5,3)


%So the general idea of what we are doing above, is that we are defining: "What is the problem? and what are the rules? "
%After defifing these set of instructions, the computer is then able to solve the problem and give solutions



