

%Defining fields: row & column 
%This will print the rown & columns
row(1..9). %this defines the field with 9 rows
col(1..9). %this defines the field with 9 columns
%This models the sudoku boards' sub squares. The coordinates map out to sudokucoordinates.jpeg
sub1(1,1; 1,2; 1,3; 2,1; 2,2; 2,3; 3,1; 3,2; 3,3). %Creates first sub square of the board 
sub2(1,4; 1,5; 1,6; 2,4; 2,5; 2,6; 3,4; 3,5; 3,6). %Creates second sub square of the board 
sub3(1,7; 1,8; 1,9; 2,7; 2,8; 2,9; 3,7; 3,8; 3,9). %Creates third sub square of the board 
sub4(4,1; 4,2; 4,3; 5,1; 5,2; 5,3; 6,1; 6,2; 6,3). %Creates fourth sub square of the board 
sub5(4,4; 4,5; 4,6; 5,4; 5,5; 5,6; 6,4; 6,5; 6,6). %Creates fifth sub square of the board 
sub6(4,7; 4,8; 4,9; 5,7; 5,8; 5,9; 6,7; 6,8; 6,9). %Creates sixth sub square of the board 
sub7(7,1; 7,2; 7,3; 8,1; 8,2; 8,3; 9,1; 9,2; 9,3). %Creates seventh sub square of the board 
sub8(7,4; 7,5; 7,6; 8,4; 8,5; 8,6; 9,4; 9,5; 9,6). %Creates eight sub square of the board 
sub9(7,7; 7,8; 7,9; 8,7; 8,8; 8,9; 9,7; 9,8; 9,9). %Creates eight sub square of the board 


num(1..9). %this gives a range of numbers that range from 1 -9


%Here we are populating the sudoku board with "numbers" in order on the sudoku board
{ sudoku(I,J,V) : row(I), col(J), num(V)}.
:- { sudoku(I,J,V) } != 17. %This will poulate the board with 17 values on the board. sudoku(I,J,V) : I = Row, J = Column, V = # from 1 - 9
:- sudoku(I,J), I = J.%Figuring out a constraint to not make I and J the samr (still trying to figure out)

%This will only output sudoku(I,J,V), it will not print out the rows, columns, nums etc. (Alejandro helped)
% #show sudoku/3.













