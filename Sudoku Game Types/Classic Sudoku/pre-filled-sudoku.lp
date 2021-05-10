%Author: Ricardo Baeza
%Last edit Date: May 7th, 2021

%Here, we are defining the attributes of the sudoku board 
row(1..9).
col(1..9).
num(1..9).

%Here we are populating the board with pre-filled spots on the sudoku board. 
%In this section we will be trying to feed these values into the sudoku board (like in sudokuExample.jpeg)...
%... and have the computer fill in the remaining spots
sudoku(1,7,2).
sudoku(2,2,8).
sudoku(2,6,7).
sudoku(2,8,9).
sudoku(3,1,6).
sudoku(3,3,2).
sudoku(3,7,5).
sudoku(4,2,7).
sudoku(4,5,6).
sudoku(5,4,9).
sudoku(5,6,1).
sudoku(6,5,2).
sudoku(6,8,4).
sudoku(7,3,5).
sudoku(7,7,6).
sudoku(7,9,3).
sudoku(8,2,9).
sudoku(8,4,4).
sudoku(8,8,7).
sudoku(9,3,6).


%Here we will define the rules, and the computer will go on from there: 

%Author: Ricardo Baeza
%Last edit Date: May 9th, 2021

%Here we are defining our sudoku board with facts. A sudoku board must constain 1-9 rows, 1-9 columns, and numbers that range from 1-9
 col(1..9).
 row(1..9). %This fact states that row is from 1 - 9.
 num(1..9).

%Choice rule
%Note: a capital letter is known as a variable
%This choice rule, helps us represent that we will have one output of sudoku
%Right now, this will just give us random values for R,C,V. Later on we will create rules that will make constraints to output 
 {sudoku(R,C,V): num(V)} == 1  :- row(R), col(C). %if we have a valid instance of row(R) and col(C) (meaning that they fall within range of our facts above (1-9)), we will give all valid options for num(V) (1-9 based on our fact above).

%Now, we will be creating rules with no head (aka constraints). So anything that satisfies the body we will not include in our solution.

%This constraint will get rid of duplicate values in the column

:- sudoku(R,C,V), sudoku(R',C,V),  R != R'.

%Now that we have no repeating numbers in each column, we will now create a constraint that will not allows for repeating numbers in each row
:- sudoku(R,C,V), sudoku(R,C',V),  C != C'. 

%At this point we have now removed duplicate numbers in the row and columns of the board 
%Now what we will need to do is remove the repeating values in each of the 9 little quares (3 x 3) in the board

%This constraint allows us to do so. 
%The reason why we divide by 3 is due to the 3 sub rows, and 3 sub columns in the sudoku board (=sqt(9))
%Mathematical Idea: source: https://stackoverflow.com/questions/5269064/sudoku-find-current-square-based-on-row-column
                    % int squareNumber(int row, int col) {
                    % int majorRow = (row-1) / width;  // zero based majorRow
                    % int majorCol = (col-1) / width;  // zero based majorCol
                    % return majorCol + majorRow * numMajorCols + 1;
                    % }
%To better understand the process of how this is working, reference: ''
:- sudoku(R,C,V), sudoku(R',C',V), ((R-1)/3) == ((R'-1)/3), ((C-1)/3) == ((C'-1)/3), R != R', C != C'. 

%To see output : result.jpeg



