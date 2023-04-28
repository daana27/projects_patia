#!/bin/bash

# Check if two arguments were passed
if [ $# -ne 2 ]; then
    echo "Usage: $0 <domain.pddl> <problem.pddl>"
    exit 1
fi

# Assign arguments to variables
d_file=$1
p_file=$2

# Set the path to the patia-sat directory
sat_path="./patia-sat"

# Change directory to the patia-sat directory
cd $sat_path

# Compile the Java files
javac -d classes -cp lib/pddl4j-4.0.0.jar:lib/sat4j-sat.jar src/fr/uga/pddl4j/examples/sat/SATEncoding.java src/fr/uga/pddl4j/examples/sat/SATMain.java

# Run the Java program with the given arguments
java -cp classes:lib/pddl4j-4.0.0.jar:lib/sat4j-sat.jar src/fr/uga/pddl4j/examples/sat/SATMain.java test/$d_file test/$p_file
