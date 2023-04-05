;; Wumpus game
(define (domain wumpus)
  (:requirements :strips :negative-preconditions)
  (:predicates
   (at ?what ?square)
   (adj ?square-1 ?square-2)
   (pit ?square)
   (wumpus-in ?square)
   (have ?who ?what)
   (is-agent ?who)
   (is-wumpus ?who)
   (is-arrow ?what)
   (dead ?who))
  
  (:functions
   (total-cost) - number
  )

  (:action move-agent
    :parameters (?who ?from ?to)
    :precondition (and 
      (is-agent ?who)
      (at ?who ?from)
      (adj ?from ?to)
      (not (pit ?to))
      (not (wumpus-in ?to))
    )
    :effect (and 
      (not (at ?who ?from))
		  (at ?who ?to)
		  (increase (total-cost) 1)
		)
  )

  (:action take
    :parameters (?who ?what ?where)
    :precondition (and 
      (is-agent ?who)
      (at ?who ?where)
      (at ?what ?where)
    )
    :effect (and 
      (have ?who ?what)
		  (not (at ?what ?where))
		  (increase (total-cost) 1)
    )
  )

  (:action shoot
    :parameters (?who ?where ?with-what ?victim ?where-victim)
    :precondition (and 
      (is-agent ?who)
      (have ?who ?with-what)
      (is-arrow ?with-what)
      (at ?who ?where)
      (is-wumpus ?victim)
      (at ?victim ?where-victim)
      (adj ?where ?where-victim)
    )
    :effect (and 
      (dead ?victim)
		  (not (wumpus-in ?where-victim))
		  (not (have ?who ?with-what))
		  (increase (total-cost) 10)
    )
  )
)