package fr.uga.pddl4j.examples.sat;

import fr.uga.pddl4j.problem.Problem;
import fr.uga.pddl4j.problem.operator.Action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class SATEncoding {
	Problem problem;

	public SATEncoding(Problem problem) {

		this.problem = problem;
	}

	public List<List<Integer>> encode(int nbsteps) {
		//Initial state
		List<List<Integer>> clauses = new ArrayList<>();
		int nbActionsFluents = (problem.getActions().size() + problem.getFluents().size());
		for (int k = 0; k < problem.getFluents().size(); k++) {
			List<Integer> clInit = new ArrayList<>();
			if (problem.getInitialState().getPositiveFluents().get(k)) {
				clInit.add(k + 1);
				clauses.add(clInit);
			} else {
				clInit.add(0 - k - 1);
				clauses.add(clInit);
			}

		}

		// parcourir les actions
		int fSize = problem.getFluents().size();
		for (int step = 0; step < nbsteps; step++) {
			for (int d = fSize + nbActionsFluents * step; d < nbActionsFluents * (step + 1); d++) {

				// fix to debug
				Action action = problem.getActions().get(d - (nbActionsFluents * step) - fSize);
				// parcourir les preconditions de chaque action
				String pStringValues = action.getPrecondition().getPositiveFluents().toString();
				String[] preconditions = pStringValues.substring(1, pStringValues.length() - 1).split(", ");
				for (int e = 0; e < preconditions.length; e++) {
					List<Integer> cl = new ArrayList<>();
					cl.add(-d - 1);
					cl.add((Integer.parseInt(preconditions[e]) + 1) + nbActionsFluents * step);
					clauses.add(cl);

				}

				// parcourir les effets positifs
				String pEffetPositifs = action.getUnconditionalEffect().getPositiveFluents().toString();
				String[] effetpositifs = pEffetPositifs.substring(1, pEffetPositifs.length() - 1).split(", ");
				String pEffetNegatifs = action.getUnconditionalEffect().getNegativeFluents().toString();
				String[] effetNegatifs = pEffetNegatifs.substring(1, pEffetNegatifs.length() - 1).split(", ");

				for (int e = 0; e < effetpositifs.length; e++) {
					List<Integer> cl = new ArrayList<>();
					cl.add(-d - 1);
					cl.add((Integer.parseInt(effetpositifs[e]) + 1) + nbActionsFluents * (step + 1));
					clauses.add(cl);

				}
				// parcourir les effets negatifs

				for (int e = 0; e < effetNegatifs.length; e++) {
					List<Integer> cl = new ArrayList<>();
					cl.add(-d - 1);
					int result = (Integer.parseInt(effetNegatifs[e]) + 1) + nbActionsFluents * (step + 1);
					cl.add(0 - result);
					clauses.add(cl);

				}

			}

		}
		// fluentAction contient une liste de Fluent contenant chaque action qui peut
		// les modifier
		HashMap<Integer, List<Integer>> fluentAction = new HashMap<>();
		for (int clause = problem.getFluents().size(); clause < clauses.size(); clause++) {
			List<Integer> cl = clauses.get(clause);
			for (int fluent = 1; fluent < cl.size(); fluent++) {
				List<Integer> tmp = new ArrayList<>();
				if (fluentAction.containsKey(cl.get(fluent))) {
					fluentAction.get(cl.get(fluent)).add(0 - cl.get(0));
				} else {

					tmp.add(0 - cl.get(0));
					fluentAction.put(cl.get(fluent), tmp);
				}
			}

		}

		// parcourir les fluents positifs
		for (Integer key : fluentAction.keySet()) {
			int next = key + nbActionsFluents;
			List<Integer> numValue = fluentAction.get(next);
			List<Integer> numValue2 = fluentAction.get(-next);
			List<Integer> cl = new ArrayList<>();
			List<Integer> cl2 = new ArrayList<>();

			cl.add(key);
			cl.add(0 - (key + nbActionsFluents));

			cl2.add(0 - (key));
			cl2.add(key + nbActionsFluents);

			if (key > ((nbActionsFluents - 1) * nbsteps)) {

			} else {
				if (numValue != null) {
					for (Integer num : numValue) {
						cl.add(num);
					}
					if (Math.abs(cl.get(0)) < Math.abs(cl.get(1))) {
						clauses.add(cl);
					}

				}
				if (numValue2 != null) {
					for (Integer num : numValue2) {
						cl2.add(num);

					}
					if (Math.abs(cl2.get(0)) < Math.abs(cl2.get(1))) {
						clauses.add(cl2);
					}
					;
				}

			}
		}



		// Disjunction
		for (int step = 0; step < nbsteps; step++) {

			for (int d = fSize + nbActionsFluents * step; d < nbActionsFluents * (step + 1); d++) {

				for (int e = d + 1; e < nbActionsFluents * (step + 1); e++) {
					List<Integer> cl = new ArrayList<>();
					cl.add(-d - 1);
					cl.add(-e - 1);
					clauses.add(cl);
				}
			}
		}
		// Goal
		for (int k = 0; k < problem.getFluents().size(); k++) {
			List<Integer> cl = new ArrayList<>();
			if (problem.getGoal().getPositiveFluents().get(k)) {
				cl.add(k + 1 + (nbActionsFluents * nbsteps));
				clauses.add(cl);
			}

		}
		return clauses;
	}
}
