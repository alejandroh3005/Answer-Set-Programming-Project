% GOAL: output solutions for a N*N Sudoku puzzle; GAMETYPE = DIAGONAL

#const n=9.	% Width/height of board. NOTE: n=4 is default; it may be user-defined in command line
#const g=3.	% Number of groups in our board. Must be equal to SQRT(n)
#const m=n*n.	% Number of spaces on our board

row(1..n).	% I
col(1..n).	% J
val(1..n).	% K

% Choice rule: Choose exactly M 'sudoku' configurations- one for each space on our board. Each 'sudoku' configuration has a row, column, and value.
{ sudoku(I,J,K) : val(K) } = 1 :- row(I), col(J).

% NOTE: Rules with no head are used to define invalid properties (any world that agrees with the rule is tossed, AKA excluded from our solution)
% Toss any world where for two choices with same I and J, they have unique K's (one K per position)
:- sudoku(I,J,K), sudoku(I,J,K'), K != K'.
% Toss any world where for two choices with same J and K, they have unique I's (one K per column)
:- sudoku(I,J,K), sudoku(I',J,K), I != I'.
% Toss any world where for two choices with same I and K, they  have unique J's (one K per row)
:- sudoku(I,J,K), sudoku(I,J',K), J != J'.
% Toss any world where for two choices with same K, they are in the same subsection (one K per subsection)
:- sudoku(I,J,K), sudoku(I',J',K), (I-1)/g == (I'-1)/g, (J-1)/g == (J'-1)/g, I != I', J != J'.

% A Diagonal: Extends from the Top Left to the Bottom Right corners
% B Diagonal: Extends from the Bottom Left to the Top Right corners
% Toss any world where for two choices with same K on the A diagonal, they are not at the same position (unique K's in A diagonal)
:- sudoku(I,I,K), sudoku(J,J,K), I != J.
% Toss any world where for two choices with same K on the B diagonal, they are not at the same position (unique K's in B diagonal)
:- sudoku(I,J,K), sudoku(I',J',K), I+J == n+1, I'+J' == n+1, (I,J) != (I',J').

% State width/height of board
#show n.
% Only show valid choices/configurations of 'sudoku' in our output
#show sudoku/3.