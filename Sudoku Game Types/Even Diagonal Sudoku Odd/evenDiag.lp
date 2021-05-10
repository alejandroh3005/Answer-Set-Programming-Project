%Author: Ricardo Baeza
%Last edit Date: May 9th, 2021
%Description: EVEN Place a digit from 1 to 9 into each of the empty squares so that each digit appears exactly once in each of the rows, 
%columns and the nine outlined 3x3 regions. The grey squares must contain even digits.

%Referene "Even Diagonal" for this
sudoku(1,3,8).          
sudoku(1,7,2).

sudoku(2,4,8).
sudoku(2,6,4).

sudoku(3,1,4).
sudoku(3,5,2).
sudoku(3,9,8).

sudoku(4,2,8).
sudoku(4,8,2).

sudoku(5,3,2).
sudoku(5,7,8).

sudoku(6,2,4).
sudoku(6,8,6).

sudoku(7,1,8).
sudoku(7,5,4).
sudoku(7,9,2).

sudoku(8,4,2).
sudoku(8,6,8).

sudoku(9,3,4).
sudoku(9,7,6).
%end


%Column = ^
%Row = ->

%Here we are defining our sudoku board with facts. A sudoku board must constain 1-9 rows, 1-9 columns, and numbers that range from 1-9
 col(1..9).
 row(1..9). %This fact states that row is from 1 - 9.
 num(1..9).

%Choice rule
%Note: a capital letter is known as a variable
%This choice rule, helps us represent that we will have one output of sudoku
%Right now, this will just give us random values for R,C,V. Later on we will create rules that will make constraints to output 
 {sudoku(R,C,V): num(V)} == 1  :- row(R), col(C). %if we have a valid instance of row(R) and col(C) (meaning that they fall within range of our facts above (1-9)), we will give all valid options for num(V) (1-9 based on our fact above).
%                         ^ this allows us to have a sudoku instance, For example, if we put the #2, then we will get unsatisbiable in the terminal 

%Now, we will be creating rules with no head (aka constraints). So anything that satisfies the body we will not include in our solution.

%This constraint will get rid of duplicate values in the column
%Note: C,V means that they have to be the same values for both sudoku constraints. However, R and R' means that they must be diff. values. 
%What we will be doing here is comparing two different rows (R and R'), R and R' will share the same column, but they are in different rows. Notice..
%..that they have the same value though; meaning that we have repeating values in a column. What this constraint does is remove repeating values...
%...in the same column. The last constraint basically says that if the two rows are not the same, then DO NOT iclude it in our solution. 
%Check 'Visual Work/removeDupInColumns.jpeg' for better understanding
:- sudoku(R,C,V), sudoku(R',C,V),  R != R'. %visialization: 'python3 sodoku_viz.py removeDupInColums.txt'

%Now that we have no repeating numbers in each column, we will now create a constraint that will not allows for repeating numbers in each row
%To better understand this process look into 'Visual Work/removeDupInRows.jpeg'
:- sudoku(R,C,V), sudoku(R,C',V),  C != C'. %visialization: 'python3 sodoku_viz.py removeDupInColAndRow.txt'

%At this point we have now removed duplicate numbers in the row and columns of the board 
%visialization: 'python3 sodoku_viz.py removeDupCol&Row.txt'

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
:- sudoku(R,C,V), sudoku(R',C',V), ((R-1)/3) == ((R'-1)/3), ((C-1)/3) == ((C'-1)/3), R != R', C != C'. %vizualisation: 'python3 sodoku_viz.py littleSquares.txt'



%(Even Diagonal) now we need to figure out a way to determine how we can get even integers and figure out some sort of constraints that will allow us to allow
%for an even integer to show on the 3rd and 7th outer values shown for row and column. Another even integer set shown on row 2 for column 4 and 6.
%Three positive integers on row three for column 1, 5 and 9. Two even integers for row 4, for column 2 and 8. Another two integers for row for column 3 and 7. 
%Then, create a constraint that can take the same patter from above and then flip them to create the same pattern for the rest of the board.


%even(E):- V%2.   //did not work
%even(E):-V/2 == 0.
%:- even(E).


%row(R), col(C), I/J, sudoku(1,9).

%:- sudoku(R,C,V), sudoku(R',C',V),((C)/2), ((R)/2) == even(E).


%evenSudoku(O,O'):-sudoku(3,7).
%evenSudoku(R,C,C):-(2,4,6)

%Trying to figure out how to determine a value was even was very difficult. Trying to make modular logical rules, in attempt to determine
%whether a value did not allow for such solution based on constraints that were thought of above. Additionally the tested constraints 
%were not enough to populate even one integer that was even to the sqaure (e.g. column 4 and 6 row 2)
%Hard coding values even integers entered to board were enterd to satisfy the even digonal.

%The values were supposed to be entered below, because the order of execution does not matter, based on research done. However, 
%when placed here, it would not execute the desired outcome therefore it was moved to top. 


%visaulization of result for python 'python3 sodoku_viz.py evenDiag.txt'
%screenshot: 'Visual Work/ evenDiag.jpeg'

























