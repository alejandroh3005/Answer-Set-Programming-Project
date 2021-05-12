% GOAL: output solutions for a N*N Sudoku puzzle; GAMETYPE = CLASSIC

#const n=9.	% Width/height of board. NOTE: n=9 is default; it may be user-defined in command line
#const g=3.	% Number of groups in our board. Must be equal to SQRT(n)
#const m=n*n.	% Number of spaces on our board

row(1..n).	% I
col(1..n).	% J
val(1..n).	% K

% Grouping rule for regular 9x9 board
group(I,J,G) :- row(I), col(J),
                D = n / g,
                X = (I - 1) / D, 
                Y = (J - 1) / D,
                G = (Y * g) + X + 1.


% Choice rule: For some valid row(I) and col(J), instantiate sudoku(I,J,1), sudoku(I,J,2), ..., sudoku(I,J,9)
% This instantiates all possible options for our board: each board position gets all 9 possible value options
1 { sudoku(I,J,K) : val(K) } 1 :- row(I), col(J).

% NOTE: Rules with no head are used to define invalid properties (any world that agrees with the rule is excluded from our solution)
% Exclude any world where for two choices with same J and K, they have unique I's (one K per column)
:- sudoku(I,J,K), sudoku(I',J,K), I != I'.
% Exclude any world where for two choices with same I and K, they  have unique J's (one K per row)
:- sudoku(I,J,K), sudoku(I,J',K), J != J'.
% Exclude any world where for two choices with same K, they are in the same subsection (one K per subsection)
:- sudoku(I,J,K), sudoku(I',J',K), group(I,J,G), group(I',J',G), (I,J) != (I',J').

% Only show valid choices/configurations of 'sudoku' in our output
#show sudoku/3.
