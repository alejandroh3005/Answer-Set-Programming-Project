

%Defining fields: row & column 
%This will print the rown & columns
row(1..9). %this defines the field with 9 rows
col(1..9). %this defines the field with 9 columns
num(1..9). %this gives a range of numbers that range from 1 -9


%Here we are populating the sudoku board with "numbers" in order on the sudoku board
{ sudoku(I,J,V) : row(I), col(J), num(V)}.
:- { sudoku(I,J,V) } != 17. %This will poulate the board with 17 values on the board. sudoku(I,J,V) : I = Row, J = Column, V = # from 1 - 9
:- sudoku(I,J), I = J.%Figuring out a constraint to not make I and J the samr (still trying to figure out)

%This will only output sudoku(I,J,V), it will not print out the rows, columns, nums etc. (Alejandro helped)
#show sudoku/3.













