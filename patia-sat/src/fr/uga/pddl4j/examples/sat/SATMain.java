package fr.uga.pddl4j.examples.sat;

import fr.uga.pddl4j.heuristics.state.StateHeuristic;
import fr.uga.pddl4j.parser.DefaultParsedProblem;
import fr.uga.pddl4j.plan.Plan;
import fr.uga.pddl4j.plan.SequentialPlan;
import fr.uga.pddl4j.planners.AbstractPlanner;
import fr.uga.pddl4j.problem.DefaultProblem;
import fr.uga.pddl4j.problem.Problem;
import fr.uga.pddl4j.problem.operator.Action;
import fr.uga.pddl4j.problem.State;

import java.util.List;
import java.util.ArrayList;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.sat4j.core.VecInt;
import org.sat4j.minisat.SolverFactory;
import org.sat4j.specs.ContradictionException;
import org.sat4j.specs.ISolver;
import org.sat4j.specs.TimeoutException;

import picocli.CommandLine;


/**
 * The class is an example. It shows how to create a simple A* search planner able to
 * solve an ADL problem by choosing the heuristic to used and its weight.
 *
 * @author D. Pellier
 * @version 4.0 - 30.11.2021
 */
@CommandLine.Command(name = "ASP",
version = "ASP 1.0",
description = "Solves a specified planning problem using A* search strategy.",
sortOptions = false,
mixinStandardHelpOptions = true,
headerHeading = "Usage:%n",
synopsisHeading = "%n",
descriptionHeading = "%nDescription:%n%n",
parameterListHeading = "%nParameters:%n",
optionListHeading = "%nOptions:%n")
public class SATMain extends AbstractPlanner {
	private static final long serialVersionUID = 1L;
	/**
	 * The class logger.
	 */
	private static final Logger LOGGER = LogManager.getLogger(SATMain.class.getName());
	/**
	 * The name of the heuristic used by the planner.
	 */
	/**
	 * The default value of the HEURISTIC property used for planner configuration.
	 */
	public static final StateHeuristic.Name DEFAULT_HEURISTIC = StateHeuristic.Name.FAST_FORWARD;

	/**
	 * Instantiates the planning problem from a parsed problem.
	 *
	 * @param problem the problem to instantiate.
	 * @return the instantiated planning problem or null if the problem cannot be instantiated.
	 */
	@Override

	public Problem instantiate(DefaultParsedProblem problem) {
		final Problem pb = new DefaultProblem(problem);
		pb.instantiate();

		return pb;
	}

	/**
	 * Search a solution plan to a specified domain and problem using A*.
	 *
	 * @param problem the problem to solve.
	 * @return the plan found or null if no plan was found.
	 */
	@Override
	public Plan solve(final Problem problem) {

		//defining variables
		SATEncoding satEncoding = new SATEncoding(problem);
		List<Integer> plan = new ArrayList<Integer>();
		List<List<Integer>> clauses;

		//Estimate the number of steps that the solver needs to solve the problem
		final StateHeuristic heuristic = StateHeuristic.getInstance(StateHeuristic.Name.FAST_FORWARD, problem);
		final State init = new State(problem.getInitialState());
		int nbSteps = heuristic.estimate(init, problem.getGoal());

		//get the clauses
		clauses = satEncoding.encode(nbSteps);


		ISolver solver = SolverFactory.newDefault();
		solver.setTimeout(300); // 1 hour timeout
		final int MAXVAR = 1000000;
		final int NBCLAUSES = 500000;



		// prepare the solver to accept MAXVAR variables. MANDATORY for MAXSAT solving
		solver.newVar(MAXVAR);
		solver.setExpectedNumberOfClauses(NBCLAUSES);
		// Feed the solver using Dimacs format, using arrays of int
		// (best option to avoid dependencies on SAT4J IVecInt)
		for (List<Integer> clause : clauses) {
			int[] intClause = clause.stream().mapToInt(i -> i).toArray();
			try {
				VecInt v = new VecInt(intClause);
				solver.addClause(v);

			} catch (ContradictionException e) {
				// TODO Auto-generated catch block

				e.printStackTrace();
			}
		}


		try {
			if (solver.isSatisfiable()) {
				int[] model = solver.model();
				for (int literal : model) {
					if (literal > 0) {
						plan.add(literal);
					}
				}
			}
		} catch (TimeoutException e) {
			// Handle timeout exception
			e.printStackTrace();
		}

		int t =(problem.getActions().size()+problem.getFluents().size());
		Plan newPlan = new SequentialPlan();

		for(int literal : plan) {
			if ((literal % t >= 1) && (literal % t <= t) && (literal / t < nbSteps)) {
				int actionId = (literal%t) - problem.getFluents().size() ;
				if( actionId>0) {
					Action action = problem.getActions().get(actionId-1);
					newPlan.add(Math.abs(literal/t), action);
				}
			}
		}
		return newPlan;
	}

	@Override
	public boolean isSupported(Problem problem) {
		return false;
	}

	/**
	 * The main method of the <code>ASP</code> planner.
	 *
	 * @param args the arguments of the command line.
	 */
	public static void main(String[] args) {
		try {
			final SATMain planner = new SATMain();
			CommandLine cmd = new CommandLine(planner);
			cmd.execute(args);

		} catch (IllegalArgumentException e) {
			LOGGER.fatal(e.getMessage());
		}
	}


}

