# CS3520 Project
## Team Members of CHOBS:
* Ricardo A. Baeza
* Alec Ortiz
* Alejandro Hernandez
* Steven Chan

<img src = "images/72dpi-Chunkies_Donnie.jpg" width ="150" /> <img src = "images/72dpi-Chunkies_Leo.jpg" width ="150" /> <img src = "images/72dpi-Chunkies_Michel.jpg" width ="150" /> <img src = "images/72dpi-Chunkies_Raph.jpg" width ="150" />

## Project Demo Presentation & Final Report
* [Demo Presentation Link](https://docs.google.com/presentation/d/1aH7-OurzBJG9XKK3rnm6s1v3DNCxw9iQLi9YTq0D78U/edit?usp=sharing)
* (Will attach once complete)

## Technologies:
* [Anaconda](https://www.anaconda.com): Version 4.10.1
* [Clingo](https://potassco.org/clingo/): Version 5.5.0

### Anaconda Installation
$ git clone https[]()://github.com/ricardoaxelbaeza/CHOBS-Project.git
* Anaconda Installation Link: https://docs.anaconda.com/anaconda/install/
* Install Anaconda for Mac OS: https://www.anaconda.com/products/individual#macos
* Install Anaconda for Windows: https://www.anaconda.com/products/individual#windows
* On the command line:
  * $ cd ../path/to/the/file
  * $ conda --v
  * $ conda install -c potassco clingo

### Repository Setup
* Clone the repository using 'git clone https<nolink>://github.com/ricardoaxelbaeza/CHOBS-Project.git'
* [Install Anaconda](https://docs.anaconda.com/anaconda/install/)
* Make sure Anaconda is installed, this can be done by entering 'conda --v' into the terminal
* Change Directory to where the project was cloned
* After making sure Anaconda is installed, we then need to install clingo. 
* Clingo is installed by entering 'conda install -c potassco clingo' into the terminal command line

### Running .lp files
* So after clingo is installed with anaconda:
* To run a .lp file: make sure that you are in the correct folder/path that the .lp file is in
* In the terminal type: 
  * $ clingo nameOfFile.lp
* If you wish to see all possible solutions (type 0): 
  * $ clingo nameOfFile.lp 0
* Specific amount of solutions (type x: x is 1,2,3 etc.)
  * $ clingo nameOfFile.lp 1

### Visualizing files
* Note: Make sure that the python visalization is in the folder that is being tested
  * $ python3 sodoku_viz.py nameOfFile.txt

## Achievements:
* Read papers of Answer Set Programming (ASP) with AnsProlog
* Completed first Answer Set Programming example: NQueens.lp
* Visualized output from NQueens.lp
* Completed first successful test sudoku.lp file!
* Visualized output from sudoku.lp
* Initiated Jupyter Notebook
* **Completed encoding of classic Sudoku**
* Visualized classic Sudoku solutions
* **Completed encoding of diagonal Sudoku**
* Visualized diagonal Sudoku solutions
 
## Next Goals:
* Grow our understanding of ASP concepts
* Continue work on report & demo presentation
* Complete encoding of other Sudoku game-types: https://www.worldpuzzle.org/championships/types-of-puzzles/wsc/

## Final Goals:
* Encode logic of multiple Sudoku game types with AnsProlog
* Visualize all game type solutions
* Demonstrate encodings & solutions in project demo
* Complete final report
