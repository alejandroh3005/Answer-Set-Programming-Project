

%Defining fields: row & column 
row(1..9). %this defines the field with 9 rows
col(1..9). %this defines the field with 9 columns


{ sudoku(I,J) : row(I), col(J) }.
:- { queen(I,J) } != 9.


