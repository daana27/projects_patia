# projet_sokoban

This project consists of two submodules: "pddl4j" and a forked version of "sokoban". "pddl4j" can be found on GitHub at https://github.com/pellierd/pddl4j.git, while "sokoban" is available at https://github.com/daana27/sokoban.git

Additionally, the project includes a bash script (sokoban.sh) that accepts a JSON file as input. This file will first be parsed and encoded as a PDDL problem using the ProblemParser project. Subsequently, the submodule "pddl4j" will be used to generate a solution for the given problem. The output of the "pddl4j" project, along with the original JSON file, will then be passed to the "sokoban" project for further processing. To facilitate this, we modified the "sokoban" project code to accept a file as an argument.

Dependencies: Maven, Gradle, Java 17
 
The folder test at the root of the project contains a list of test to be passed to the project.


To run the script, follow these steps:

- Open a terminal or command prompt.
- Navigate to the project directory using the "cd" command.
- Execute the following command: "bash sokoban.sh test/test1.json"

This will run the script with the "test1.json" file as input. You can replace "test1.json" with the name of any other test file you wish to use. The script will parse the input file, generate a solution using the "pddl4j" submodule, and encode it using the "sokoban" submodule. The output will be displayed at http://localhost:8888/test.html



