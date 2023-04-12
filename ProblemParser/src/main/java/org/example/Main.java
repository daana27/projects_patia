package org.example;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;

public class Main {
    public static void main(String[] args) {
        Parser parser = new Parser();
        String name1 = args[0];
        String name = "";

        char[][] m = parser.Format(name1);
        int position = name1.lastIndexOf(".");
        if (position > 0) {
            name = name1.substring(0, position);
        }
        String txt = "(define (problem " + name + ")\n" +
                "(:domain SOKOBAN)\n" +
                "(:objects\n" +
                "dir-nord - direction \n" +
                "dir-sud - direction \n" +
                "dir-est - direction\n" +
                "dir-ouest - direction\n" +
                "player - guard\n";
        int profondeur = m.length;
        int largueur = m[0].length;
        String tmp = "";
        int cpt_box = 1;
        String box = "";
        String goal = "";
        String deja_goal = "";

        for (int i = 0; i < profondeur; i++) {
            for (int j = 0; j < largueur; j++) {
                if (m[i][j] != 'x') {
                    txt += "pos-" + (i + 1) + "-" + (j + 1) + " - location\n";
                }
                if (m[i][j] == '*') {
                    deja_goal += "(atgoal box-" + cpt_box + ")\n";
                }

                if (m[i][j] == '$' || m[i][j] == '*') {
                    tmp += "box-" + cpt_box + " - box\n";
                    box += "(at box-" + cpt_box + " pos-" + (i + 1) + "-" + (j + 1) + ")\n";
                    goal += "(atgoal box-" + cpt_box + ")\n";
                    cpt_box++;

                }
            }
        }
        txt += tmp + ")\n(:init\n";

        String pos = "";
        String pla = "";
        String cle = "";
        String not = "";
        String guard = "";

        for (int i = 0; i < m.length; i++) {
            for (int j = 0; j < m[i].length; j++) {
                if (m[i][j] != 'x') {
                    if (m[i][j] == '.' || m[i][j] == '*' || m[i][j] == '+') {
                        txt += "(goal pos-" + (i + 1) + "-" + (j + 1) + ")\n";
                    } else {
                        not += "(notgoal pos-" + (i + 1) + "-" + (j + 1) + ")\n";
                    }
                    if (m[i][j] == '+') {
                        pla += "(goal pos-" + (i + 1) + "-" + (j + 1) + ")\n";
                    }
                    if (m[i][j] == ' ' || m[i][j] == '.') {
                        cle += "(clear pos-" + (i + 1) + "-" + (j + 1) + ")\n";
                    }
                    if (m[i][j] == '@' || m[i][j] == '+') {
                        guard += "(at player " + "pos-" + (i + 1) + "-" + (j + 1) + ")\n";
                    }
                    if ((i + 1) < profondeur && m[i + 1][j] != 'x') {
                        pos += "(deplacement pos-" + (i + 1) + "-" + (j + 1) + " pos-" + (i + 2) + "-" + (j + 1)
                                + " dir-sud)\n";
                    }
                    if ((i > 0) && m[i - 1][j] != 'x') {
                        pos += "(deplacement pos-" + (i + 1) + "-" + (j + 1) + " pos-" + (i) + "-" + (j + 1)
                                + " dir-nord)\n";
                    }
                    if ((j + 1) < largueur && m[i][j + 1] != 'x') {
                        pos += "(deplacement pos-" + (i + 1) + "-" + (j + 1) + " pos-" + (i + 1) + "-" + (j + 2)
                                + " dir-est)\n";
                    }
                    if ((j > 0) && m[i][j - 1] != 'x') {
                        pos += "(deplacement pos-" + (i + 1) + "-" + (j + 1) + " pos-" + (i + 1) + "-" + (j)
                                + " dir-ouest)\n";
                    }
                }

            }
        }

        txt += not + pos + guard + deja_goal + pla + box + cle + ")\n(:goal (and\n" + goal + "))\n)";

        File f = new File("src/main/resources/" + name + ".pddl");
        try (PrintWriter writer = new PrintWriter(f)) {
            writer.println(txt);
            writer.close();
        } catch (FileNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}