size = 9

def collect(stream):
   solutions  = []
   board = [['-' for c in range(size)] for r in range(size)]
   found = False 
   for line in stream:
      if line[0:7] == "sudoku(":
         found = True
         # board = [['-' for c in range(board_size)] for r in range(board_size)]
         solution = line[:]
         data = solution.translate({ord(i): None for i in 'sudoku'}).replace(".", "").replace("\n", "")
         for pair in data.split():
            row = int(pair[-6])
            col = int(pair[-4])
            val = str(pair[-2])
            board[row-1][col-1] = val
   if (found): 
      return board
   else:
      return None

import sys

file = open(sys.argv[1], 'r')
board = collect(file.readlines())
size = len(board)
for row in range(size):
   for col in range(size):
      print("{}".format(board[row][col]), end=' ')
   print()
print("\033[0m ")
