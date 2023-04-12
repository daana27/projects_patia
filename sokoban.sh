#!/bin/bash

# check if json file is provided
if [ $# -eq 0 ]; then
    echo "Please, provide a JSON file."
    exit 1
fi

# set variables for the paths of the two Maven projects
parser_path="./ProblemParser"
if [ ! -d pddl4j ]; then
git clone https://github.com/pellierd/pddl4j.git pddl4j
fi

if [ ! -d sokoban ]; then
git clone https://github.com/daana27/sokoban.git sokoban
fi
sokoban_path="./sokoban" 
pddl4j_path="./pddl4j"


# get json file from argument

file=$1
echo "$(basename "$file")"
json_file="$(basename "$file")"
file_name="${json_file%.*}"
ext=".pddl"
pb_file="$file_name$ext"




# execute parser
cp $file $sokoban_path/config/
cp $file $parser_path/src/main/resources/
cd $parser_path
mvn clean
mvn compile
mvn exec:java -Dexec.mainClass="org.example.Main" -Dexec.args="$json_file" 


cp src/main/resources/sokoban_dm.pddl ../$pddl4j_path/
cp src/main/resources/$pb_file ../$pddl4j_path/

cd ..
cd $pddl4j_path

cp ../gradleconfig.properties gradle/wrapper/gradle-wrapper.properties

if [ ! -d build/libs ]; then
./gradlew jar
fi

java -cp ./build/libs/pddl4j-4.0.0.jar fr.uga.pddl4j.planners.statespace.HSP\
     sokoban_dm.pddl\
     $pb_file\
     -e MAX\
     -w 1.2\
     -t 1000  > result.txt


# copy the solution from parser to sokoban
cp result.txt ../$sokoban_path/result.txt

# navigate to the second Maven project directory and execute the project
cd ..
cd $sokoban_path

mvn compile
java --add-opens java.base/java.lang=ALL-UNNAMED \
      -server -Xms2048m -Xmx2048m \
      -cp "$(mvn dependency:build-classpath -Dmdep.outputFile=/dev/stdout -q):target/test-classes/:target/classes" \
      sokoban.SokobanMain $json_file



