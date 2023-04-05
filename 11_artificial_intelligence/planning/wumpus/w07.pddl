(define
	(problem w07	)
	(:domain wumpus	)
	(:objects 
		sq-0-0
		sq-0-1
		sq-0-2
		sq-0-3
		sq-0-4
		sq-0-5
		sq-0-6
		sq-0-7
		sq-0-8
		sq-0-9
		sq-1-0
		sq-1-1
		sq-1-2
		sq-1-3
		sq-1-4
		sq-1-5
		sq-1-6
		sq-1-7
		sq-1-8
		sq-1-9
		sq-2-0
		sq-2-1
		sq-2-2
		sq-2-3
		sq-2-4
		sq-2-5
		sq-2-6
		sq-2-7
		sq-2-8
		sq-2-9
		sq-3-0
		sq-3-1
		sq-3-2
		sq-3-3
		sq-3-4
		sq-3-5
		sq-3-6
		sq-3-7
		sq-3-8
		sq-3-9
		sq-4-0
		sq-4-1
		sq-4-2
		sq-4-3
		sq-4-4
		sq-4-5
		sq-4-6
		sq-4-7
		sq-4-8
		sq-4-9
		sq-5-0
		sq-5-1
		sq-5-2
		sq-5-3
		sq-5-4
		sq-5-5
		sq-5-6
		sq-5-7
		sq-5-8
		sq-5-9
		sq-6-0
		sq-6-1
		sq-6-2
		sq-6-3
		sq-6-4
		sq-6-5
		sq-6-6
		sq-6-7
		sq-6-8
		sq-6-9
		sq-7-0
		sq-7-1
		sq-7-2
		sq-7-3
		sq-7-4
		sq-7-5
		sq-7-6
		sq-7-7
		sq-7-8
		sq-7-9
		sq-8-0
		sq-8-1
		sq-8-2
		sq-8-3
		sq-8-4
		sq-8-5
		sq-8-6
		sq-8-7
		sq-8-8
		sq-8-9
		sq-9-0
		sq-9-1
		sq-9-2
		sq-9-3
		sq-9-4
		sq-9-5
		sq-9-6
		sq-9-7
		sq-9-8
		sq-9-9
		gold
		arrow
		agent
		wumpus
	)
	(:init 
		(adj sq-0-0 sq-0-1)
		(adj sq-0-1 sq-0-0)
		(adj sq-0-0 sq-1-0)
		(adj sq-1-0 sq-0-0)
		(adj sq-0-1 sq-0-2)
		(adj sq-0-2 sq-0-1)
		(adj sq-0-1 sq-1-1)
		(adj sq-1-1 sq-0-1)
		(adj sq-0-2 sq-0-3)
		(adj sq-0-3 sq-0-2)
		(adj sq-0-2 sq-1-2)
		(adj sq-1-2 sq-0-2)
		(adj sq-0-3 sq-0-4)
		(adj sq-0-4 sq-0-3)
		(adj sq-0-3 sq-1-3)
		(adj sq-1-3 sq-0-3)
		(adj sq-0-4 sq-0-5)
		(adj sq-0-5 sq-0-4)
		(adj sq-0-4 sq-1-4)
		(adj sq-1-4 sq-0-4)
		(adj sq-0-5 sq-0-6)
		(adj sq-0-6 sq-0-5)
		(adj sq-0-5 sq-1-5)
		(adj sq-1-5 sq-0-5)
		(adj sq-0-6 sq-0-7)
		(adj sq-0-7 sq-0-6)
		(adj sq-0-6 sq-1-6)
		(adj sq-1-6 sq-0-6)
		(adj sq-0-7 sq-0-8)
		(adj sq-0-8 sq-0-7)
		(adj sq-0-7 sq-1-7)
		(adj sq-1-7 sq-0-7)
		(adj sq-0-8 sq-0-9)
		(adj sq-0-9 sq-0-8)
		(adj sq-0-8 sq-1-8)
		(adj sq-1-8 sq-0-8)
		(adj sq-0-9 sq-1-9)
		(adj sq-1-9 sq-0-9)
		(adj sq-1-0 sq-1-1)
		(adj sq-1-1 sq-1-0)
		(adj sq-1-0 sq-2-0)
		(adj sq-2-0 sq-1-0)
		(adj sq-1-1 sq-1-2)
		(adj sq-1-2 sq-1-1)
		(adj sq-1-1 sq-2-1)
		(adj sq-2-1 sq-1-1)
		(adj sq-1-2 sq-1-3)
		(adj sq-1-3 sq-1-2)
		(adj sq-1-2 sq-2-2)
		(adj sq-2-2 sq-1-2)
		(adj sq-1-3 sq-1-4)
		(adj sq-1-4 sq-1-3)
		(adj sq-1-3 sq-2-3)
		(adj sq-2-3 sq-1-3)
		(adj sq-1-4 sq-1-5)
		(adj sq-1-5 sq-1-4)
		(adj sq-1-4 sq-2-4)
		(adj sq-2-4 sq-1-4)
		(adj sq-1-5 sq-1-6)
		(adj sq-1-6 sq-1-5)
		(adj sq-1-5 sq-2-5)
		(adj sq-2-5 sq-1-5)
		(adj sq-1-6 sq-1-7)
		(adj sq-1-7 sq-1-6)
		(adj sq-1-6 sq-2-6)
		(adj sq-2-6 sq-1-6)
		(adj sq-1-7 sq-1-8)
		(adj sq-1-8 sq-1-7)
		(adj sq-1-7 sq-2-7)
		(adj sq-2-7 sq-1-7)
		(adj sq-1-8 sq-1-9)
		(adj sq-1-9 sq-1-8)
		(adj sq-1-8 sq-2-8)
		(adj sq-2-8 sq-1-8)
		(adj sq-1-9 sq-2-9)
		(adj sq-2-9 sq-1-9)
		(adj sq-2-0 sq-2-1)
		(adj sq-2-1 sq-2-0)
		(adj sq-2-0 sq-3-0)
		(adj sq-3-0 sq-2-0)
		(adj sq-2-1 sq-2-2)
		(adj sq-2-2 sq-2-1)
		(adj sq-2-1 sq-3-1)
		(adj sq-3-1 sq-2-1)
		(adj sq-2-2 sq-2-3)
		(adj sq-2-3 sq-2-2)
		(adj sq-2-2 sq-3-2)
		(adj sq-3-2 sq-2-2)
		(adj sq-2-3 sq-2-4)
		(adj sq-2-4 sq-2-3)
		(adj sq-2-3 sq-3-3)
		(adj sq-3-3 sq-2-3)
		(adj sq-2-4 sq-2-5)
		(adj sq-2-5 sq-2-4)
		(adj sq-2-4 sq-3-4)
		(adj sq-3-4 sq-2-4)
		(adj sq-2-5 sq-2-6)
		(adj sq-2-6 sq-2-5)
		(adj sq-2-5 sq-3-5)
		(adj sq-3-5 sq-2-5)
		(adj sq-2-6 sq-2-7)
		(adj sq-2-7 sq-2-6)
		(adj sq-2-6 sq-3-6)
		(adj sq-3-6 sq-2-6)
		(adj sq-2-7 sq-2-8)
		(adj sq-2-8 sq-2-7)
		(adj sq-2-7 sq-3-7)
		(adj sq-3-7 sq-2-7)
		(adj sq-2-8 sq-2-9)
		(adj sq-2-9 sq-2-8)
		(adj sq-2-8 sq-3-8)
		(adj sq-3-8 sq-2-8)
		(adj sq-2-9 sq-3-9)
		(adj sq-3-9 sq-2-9)
		(adj sq-3-0 sq-3-1)
		(adj sq-3-1 sq-3-0)
		(adj sq-3-0 sq-4-0)
		(adj sq-4-0 sq-3-0)
		(adj sq-3-1 sq-3-2)
		(adj sq-3-2 sq-3-1)
		(adj sq-3-1 sq-4-1)
		(adj sq-4-1 sq-3-1)
		(adj sq-3-2 sq-3-3)
		(adj sq-3-3 sq-3-2)
		(adj sq-3-2 sq-4-2)
		(adj sq-4-2 sq-3-2)
		(adj sq-3-3 sq-3-4)
		(adj sq-3-4 sq-3-3)
		(adj sq-3-3 sq-4-3)
		(adj sq-4-3 sq-3-3)
		(adj sq-3-4 sq-3-5)
		(adj sq-3-5 sq-3-4)
		(adj sq-3-4 sq-4-4)
		(adj sq-4-4 sq-3-4)
		(adj sq-3-5 sq-3-6)
		(adj sq-3-6 sq-3-5)
		(adj sq-3-5 sq-4-5)
		(adj sq-4-5 sq-3-5)
		(adj sq-3-6 sq-3-7)
		(adj sq-3-7 sq-3-6)
		(adj sq-3-6 sq-4-6)
		(adj sq-4-6 sq-3-6)
		(adj sq-3-7 sq-3-8)
		(adj sq-3-8 sq-3-7)
		(adj sq-3-7 sq-4-7)
		(adj sq-4-7 sq-3-7)
		(adj sq-3-8 sq-3-9)
		(adj sq-3-9 sq-3-8)
		(adj sq-3-8 sq-4-8)
		(adj sq-4-8 sq-3-8)
		(adj sq-3-9 sq-4-9)
		(adj sq-4-9 sq-3-9)
		(adj sq-4-0 sq-4-1)
		(adj sq-4-1 sq-4-0)
		(adj sq-4-0 sq-5-0)
		(adj sq-5-0 sq-4-0)
		(adj sq-4-1 sq-4-2)
		(adj sq-4-2 sq-4-1)
		(adj sq-4-1 sq-5-1)
		(adj sq-5-1 sq-4-1)
		(adj sq-4-2 sq-4-3)
		(adj sq-4-3 sq-4-2)
		(adj sq-4-2 sq-5-2)
		(adj sq-5-2 sq-4-2)
		(adj sq-4-3 sq-4-4)
		(adj sq-4-4 sq-4-3)
		(adj sq-4-3 sq-5-3)
		(adj sq-5-3 sq-4-3)
		(adj sq-4-4 sq-4-5)
		(adj sq-4-5 sq-4-4)
		(adj sq-4-4 sq-5-4)
		(adj sq-5-4 sq-4-4)
		(adj sq-4-5 sq-4-6)
		(adj sq-4-6 sq-4-5)
		(adj sq-4-5 sq-5-5)
		(adj sq-5-5 sq-4-5)
		(adj sq-4-6 sq-4-7)
		(adj sq-4-7 sq-4-6)
		(adj sq-4-6 sq-5-6)
		(adj sq-5-6 sq-4-6)
		(adj sq-4-7 sq-4-8)
		(adj sq-4-8 sq-4-7)
		(adj sq-4-7 sq-5-7)
		(adj sq-5-7 sq-4-7)
		(adj sq-4-8 sq-4-9)
		(adj sq-4-9 sq-4-8)
		(adj sq-4-8 sq-5-8)
		(adj sq-5-8 sq-4-8)
		(adj sq-4-9 sq-5-9)
		(adj sq-5-9 sq-4-9)
		(adj sq-5-0 sq-5-1)
		(adj sq-5-1 sq-5-0)
		(adj sq-5-0 sq-6-0)
		(adj sq-6-0 sq-5-0)
		(adj sq-5-1 sq-5-2)
		(adj sq-5-2 sq-5-1)
		(adj sq-5-1 sq-6-1)
		(adj sq-6-1 sq-5-1)
		(adj sq-5-2 sq-5-3)
		(adj sq-5-3 sq-5-2)
		(adj sq-5-2 sq-6-2)
		(adj sq-6-2 sq-5-2)
		(adj sq-5-3 sq-5-4)
		(adj sq-5-4 sq-5-3)
		(adj sq-5-3 sq-6-3)
		(adj sq-6-3 sq-5-3)
		(adj sq-5-4 sq-5-5)
		(adj sq-5-5 sq-5-4)
		(adj sq-5-4 sq-6-4)
		(adj sq-6-4 sq-5-4)
		(adj sq-5-5 sq-5-6)
		(adj sq-5-6 sq-5-5)
		(adj sq-5-5 sq-6-5)
		(adj sq-6-5 sq-5-5)
		(adj sq-5-6 sq-5-7)
		(adj sq-5-7 sq-5-6)
		(adj sq-5-6 sq-6-6)
		(adj sq-6-6 sq-5-6)
		(adj sq-5-7 sq-5-8)
		(adj sq-5-8 sq-5-7)
		(adj sq-5-7 sq-6-7)
		(adj sq-6-7 sq-5-7)
		(adj sq-5-8 sq-5-9)
		(adj sq-5-9 sq-5-8)
		(adj sq-5-8 sq-6-8)
		(adj sq-6-8 sq-5-8)
		(adj sq-5-9 sq-6-9)
		(adj sq-6-9 sq-5-9)
		(adj sq-6-0 sq-6-1)
		(adj sq-6-1 sq-6-0)
		(adj sq-6-0 sq-7-0)
		(adj sq-7-0 sq-6-0)
		(adj sq-6-1 sq-6-2)
		(adj sq-6-2 sq-6-1)
		(adj sq-6-1 sq-7-1)
		(adj sq-7-1 sq-6-1)
		(adj sq-6-2 sq-6-3)
		(adj sq-6-3 sq-6-2)
		(adj sq-6-2 sq-7-2)
		(adj sq-7-2 sq-6-2)
		(adj sq-6-3 sq-6-4)
		(adj sq-6-4 sq-6-3)
		(adj sq-6-3 sq-7-3)
		(adj sq-7-3 sq-6-3)
		(adj sq-6-4 sq-6-5)
		(adj sq-6-5 sq-6-4)
		(adj sq-6-4 sq-7-4)
		(adj sq-7-4 sq-6-4)
		(adj sq-6-5 sq-6-6)
		(adj sq-6-6 sq-6-5)
		(adj sq-6-5 sq-7-5)
		(adj sq-7-5 sq-6-5)
		(adj sq-6-6 sq-6-7)
		(adj sq-6-7 sq-6-6)
		(adj sq-6-6 sq-7-6)
		(adj sq-7-6 sq-6-6)
		(adj sq-6-7 sq-6-8)
		(adj sq-6-8 sq-6-7)
		(adj sq-6-7 sq-7-7)
		(adj sq-7-7 sq-6-7)
		(adj sq-6-8 sq-6-9)
		(adj sq-6-9 sq-6-8)
		(adj sq-6-8 sq-7-8)
		(adj sq-7-8 sq-6-8)
		(adj sq-6-9 sq-7-9)
		(adj sq-7-9 sq-6-9)
		(adj sq-7-0 sq-7-1)
		(adj sq-7-1 sq-7-0)
		(adj sq-7-0 sq-8-0)
		(adj sq-8-0 sq-7-0)
		(adj sq-7-1 sq-7-2)
		(adj sq-7-2 sq-7-1)
		(adj sq-7-1 sq-8-1)
		(adj sq-8-1 sq-7-1)
		(adj sq-7-2 sq-7-3)
		(adj sq-7-3 sq-7-2)
		(adj sq-7-2 sq-8-2)
		(adj sq-8-2 sq-7-2)
		(adj sq-7-3 sq-7-4)
		(adj sq-7-4 sq-7-3)
		(adj sq-7-3 sq-8-3)
		(adj sq-8-3 sq-7-3)
		(adj sq-7-4 sq-7-5)
		(adj sq-7-5 sq-7-4)
		(adj sq-7-4 sq-8-4)
		(adj sq-8-4 sq-7-4)
		(adj sq-7-5 sq-7-6)
		(adj sq-7-6 sq-7-5)
		(adj sq-7-5 sq-8-5)
		(adj sq-8-5 sq-7-5)
		(adj sq-7-6 sq-7-7)
		(adj sq-7-7 sq-7-6)
		(adj sq-7-6 sq-8-6)
		(adj sq-8-6 sq-7-6)
		(adj sq-7-7 sq-7-8)
		(adj sq-7-8 sq-7-7)
		(adj sq-7-7 sq-8-7)
		(adj sq-8-7 sq-7-7)
		(adj sq-7-8 sq-7-9)
		(adj sq-7-9 sq-7-8)
		(adj sq-7-8 sq-8-8)
		(adj sq-8-8 sq-7-8)
		(adj sq-7-9 sq-8-9)
		(adj sq-8-9 sq-7-9)
		(adj sq-8-0 sq-8-1)
		(adj sq-8-1 sq-8-0)
		(adj sq-8-0 sq-9-0)
		(adj sq-9-0 sq-8-0)
		(adj sq-8-1 sq-8-2)
		(adj sq-8-2 sq-8-1)
		(adj sq-8-1 sq-9-1)
		(adj sq-9-1 sq-8-1)
		(adj sq-8-2 sq-8-3)
		(adj sq-8-3 sq-8-2)
		(adj sq-8-2 sq-9-2)
		(adj sq-9-2 sq-8-2)
		(adj sq-8-3 sq-8-4)
		(adj sq-8-4 sq-8-3)
		(adj sq-8-3 sq-9-3)
		(adj sq-9-3 sq-8-3)
		(adj sq-8-4 sq-8-5)
		(adj sq-8-5 sq-8-4)
		(adj sq-8-4 sq-9-4)
		(adj sq-9-4 sq-8-4)
		(adj sq-8-5 sq-8-6)
		(adj sq-8-6 sq-8-5)
		(adj sq-8-5 sq-9-5)
		(adj sq-9-5 sq-8-5)
		(adj sq-8-6 sq-8-7)
		(adj sq-8-7 sq-8-6)
		(adj sq-8-6 sq-9-6)
		(adj sq-9-6 sq-8-6)
		(adj sq-8-7 sq-8-8)
		(adj sq-8-8 sq-8-7)
		(adj sq-8-7 sq-9-7)
		(adj sq-9-7 sq-8-7)
		(adj sq-8-8 sq-8-9)
		(adj sq-8-9 sq-8-8)
		(adj sq-8-8 sq-9-8)
		(adj sq-9-8 sq-8-8)
		(adj sq-8-9 sq-9-9)
		(adj sq-9-9 sq-8-9)
		(adj sq-9-0 sq-9-1)
		(adj sq-9-1 sq-9-0)
		(adj sq-9-1 sq-9-2)
		(adj sq-9-2 sq-9-1)
		(adj sq-9-2 sq-9-3)
		(adj sq-9-3 sq-9-2)
		(adj sq-9-3 sq-9-4)
		(adj sq-9-4 sq-9-3)
		(adj sq-9-4 sq-9-5)
		(adj sq-9-5 sq-9-4)
		(adj sq-9-5 sq-9-6)
		(adj sq-9-6 sq-9-5)
		(adj sq-9-6 sq-9-7)
		(adj sq-9-7 sq-9-6)
		(adj sq-9-7 sq-9-8)
		(adj sq-9-8 sq-9-7)
		(adj sq-9-8 sq-9-9)
		(adj sq-9-9 sq-9-8)

		(pit sq-2-0)
		(pit sq-2-1)
		(pit sq-2-2)
		(pit sq-1-2)
		(pit sq-0-2)

		(is-gold gold)
		(at gold sq-5-5)

		(is-agent agent)
		(at agent sq-0-0)

		(is-wumpus wumpus)
		(at wumpus sq-9-0)

		(wumpus-in sq-9-0)

		(is-arrow arrow)
		(have agent arrow)

		(= (total-cost) 0)
	)
	(:goal (and
			(have agent gold)
			(at agent sq-0-0)
		)
	)
	(:metric 
		minimize (total-cost)
	)
)