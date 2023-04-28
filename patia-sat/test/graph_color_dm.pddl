(define (domain COLOR)
  (:requirements :strips :typing)
  (:types node edge color)
  (:predicates (colored ?x - node ?y - color)
	       (connected ?x - node ?y - node)
        (diff ?a - color ?b - color)
        (clear ?x - node)
        (deconecte ?x - node ?y - node)
        (void ?x - node)
        
   )

  (:action colore
	     :parameters (?x - node ?y - color) 
	     :precondition (and(clear ?x)(void ?x))
	     :effect
		   (and(colored ?x ?y)(not(void ?x)))
  )
  (:action free_edge
    	:parameters (?x - node ?y -node ?a - color ?b - color) 
	    :precondition (and (connected ?x ?y) (colored ?x ?a) (colored ?y ?b) (diff ?a ?b) )
	    :effect
      (and (not (connected ?x ?y))(deconecte ?x ?y)(not(clear ?x))(not(clear ?y)))
  )
)