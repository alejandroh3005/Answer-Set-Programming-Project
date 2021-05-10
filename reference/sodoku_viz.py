def collect(stream):
   solutions  = []
   board_size = 0
   for line in stream:
      if line[0].isdigit():
         board_size = int(line[0])
         board = [[0 for c in range(board_size)] for r in range(board_size)]
         solution = line[2:]
         data = solution.translate({ord(i): None for i in 'sudoku'}).replace(", ", ",")
         for pair in data.split():
            row = int(pair[-6])
            col = int(pair[-4])
            val = int(pair[-2])
            board[row-1][col-1] = val
         solutions.append(board)    
   return (solutions)

import sys

file = open(sys.argv[1], 'r')
solution_set = collect(file.readlines())
count = 0
for board in solution_set:
   size = len(board)
   count += 1
   print("Solution : {}\033[33m".format(count))
   for row in range(size):
      for col in range(size):
         print("{}".format(board[row][col]), end=' ')
      print()
   print("\033[0m ")
