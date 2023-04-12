package org.example;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import java.io.FileReader;

public class Parser {
    char [][] mat;

    public Parser(){
    }
    public char[][] Format(String value) {
        String problem="";
        try (FileReader reader = new FileReader(this.getClass().getClassLoader().getResource(value).getFile())) {
            // read the json file
            JSONParser jsonParser = new JSONParser();
            JSONObject jsonObject = (JSONObject) jsonParser.parse(reader);

            // get a String from the JSON object
            problem = (String) jsonObject.get("testIn");
            int width = 0;
            String[] lines = problem.split("\n");
            for (String line : lines) {
                int length = line.length();
                if (length > width) {
                    width = length;
                }
            }
            mat = new char[lines.length][width];
            String check = "";
            for (int i = 0; i < lines.length; i++) {
                if(lines[i].length()==width){
                    mat[i] = lines[i].replaceAll("#","x").toCharArray();
                }
                else{
                    int n = width-lines[i].length();
                    char val = 'x';
                    check = lines[i];
                    for (int j = 0; j < n; j++) {
                        check += val;
                    }
                    mat[i] = check.replaceAll("#","x").toCharArray();
                }
            }
            } catch (Exception ex) {
            ex.printStackTrace();
        }
        return mat;
    }
}