"""
Created by Alejandro Hernandez - 4/26/2021
N-QUEEN EXAMPLE:
    Give a chess board of size N, can we place N Queens on it
    so that none of them are placed in another's range of attack?

Breakdown of logical constraints:
QUEEN.LP
    row(1..n).                              # Valid rows are row(1) row(2) ... row(n)
    col(1..n).                              # Valid columns are col(1) col(2) ... col(n)
    { queen(I,J) : row(I), col(J) }.        # queen(I,J) has row(I) and col(J)
    :- { queen(I,J) } != n.                 # Number of queens should be equal to n
    :- queen(I,J), queen(I,J'), J != J'.    # Queens cannot share a column
    :- queen(I,J), queen(I',J), I != I'.    # Queens cannot share a row
    :- queen(I,J), queen(I',J'), (I,J) != (I',J'), I-J == I'-J'.    # Queens cannot share a POSITIVE* diagonal path
    :- queen(I,J), queen(I',J'), (I,J) != (I',J'), I+J == I'+J'.    # Queens cannot  share a NEGATIVE* diagonal path

    * Positive and Negative refers to the incline of the diagonal
"""

# Given Clingo output, organize location answers as tuples within an array
def get_queen_locations(lines):
    locations = []
    number_of_answers = 0
    for line in lines:
        if "queen(" in line:
            # print(line)
            locations.append([])
            line = line.split()
            for word in line:
                if "queen" in word:
                    x = int(word[-4])
                    y = int(word[-2])
                    locations[number_of_answers].append((x-1, y-1))
            number_of_answers += 1
    return locations

# Given size of a board, create and return an empty n*n board (2D array)
def create_empty_board(board_size):
    empty_board = []
    for row in range(SIZE_OF_BOARD):
        empty_board.append([])
        for col in range(SIZE_OF_BOARD):
            empty_board[row].append(0)
    return empty_board

# Given a board, add queens given queen locations
def add_queen_locations(locations, board):
    final = board
    for solution in locations:
        x = solution[0]
        y = solution[1]
        print("Queen: ", (x+1, y+1))
        final[x][y] = 1
    return final


file = open("clingo_output.txt", 'r')
file_lines = file.readlines()
SIZE_OF_BOARD = 4
queens = []

# Put queen locations into an array
solutions = get_queen_locations(file_lines)
# Initialize an empty n*n board
empty_board = create_empty_board(SIZE_OF_BOARD)
# For each solution, add queen locations to a board.
i = 0
for locations in solutions:     # Each solution will have n locations. For each solution, map all locations onto board.
    i += 1  # i is only used to print (see next line)
    print("Solution", i)
    board = create_empty_board(SIZE_OF_BOARD)
    final_board = add_queen_locations(locations, board)
    for row in final_board:
        print(row)
    print()