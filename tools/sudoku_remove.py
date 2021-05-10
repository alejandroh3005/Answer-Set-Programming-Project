import sys
import random

size = 9

def collect(stream):
   solutions  = []
   board_size = 0
   for line in stream:
      if line[0:7] == "sudoku(":
         board_size = size
         board = [[0 for c in range(board_size)] for r in range(board_size)]
         solution = line[:]
         data = solution.translate({ord(i): None for i in 'sudoku'}).replace(", ", ",")
         for pair in data.split():
            row = int(pair[-6])
            col = int(pair[-4])
            val = int(pair[-2])
            board[row-1][col-1] = val
         solutions.append(board)
         break    
   return (solutions[0])


def main():
    file = open(sys.argv[1], 'r')
    difficulty = float(sys.argv[2])
    solution_set = collect(file.readlines())
    output_txt = ""
    if len(solution_set) > 0:
        for i in range(len(solution_set)):
            for j in range(len(solution_set[0])):
                rand = random.uniform(0, 1)
                if (rand > difficulty):
                    output_txt += "sudoku(%d,%d,%d).\n"%(i + 1, j + 1, solution_set[i][j])
    with open(sys.argv[3], 'w') as file:
        file.write(output_txt)

    



if __name__ == "__main__" and len(sys.argv) == 4 and float(sys.argv[2]) <= 1 and float(sys.argv[2]) >= 0:
    main()