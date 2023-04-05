(define (domain vampire)
    (:requirements :conditional-effects :negative-preconditions :disjunctive-preconditions)
    (:predicates
        (light-on ?r)
        (slayer-is-alive)
        (slayer-is-in ?r)
        (vampire-is-alive)
        (vampire-is-in ?r)
        (fighting)
        ;
        ; static predicates
        (NEXT-ROOM ?r ?rn)
        (CONTAINS-GARLIC ?r)
    )

    (:action toggle-light
        :parameters (?anti-clockwise-neighbor ?room ?clockwise-neighbor)
        :precondition (and
            (NEXT-ROOM ?anti-clockwise-neighbor ?room)
            (NEXT-ROOM ?room ?clockwise-neighbor)
            (not(fighting))
        )
        :effect (and 
            ;; Switch on
            (when
                ;Antecedent
                (and 
                    (not(light-on ?room))
                )
                ;Consequence
                (and 
                    (light-on ?room)
                )
            )
            ;; Switch off
            (when
                ;Antecedent
                (and 
                    (light-on ?room)    
                )
                ;Consequence
                (and 
                    (not(light-on ?room))
                )
            )
            ;; Switching on - Move vampire anti clockwise
            (when
                ;Antecedent
                (and 
                    (vampire-is-alive)
                    (vampire-is-in ?room)
                    (not(light-on ?room))
                    (not(light-on ?anti-clockwise-neighbor))    
                )
                ;Consequence
                (and 
                    (not(vampire-is-in ?room)) 
                    (vampire-is-in ?anti-clockwise-neighbor)
                    ;Check for fight
                    (when
                        ;Antecedent
                        (and (slayer-is-alive)
                             (slayer-is-in ?anti-clockwise-neighbor))
                        ;Consequence
                        (and 
                            (fighting)
                        )
                    )
                )
            )
            ;; Switching on - Move vampire clockwise
            (when
                ;Antecedent
                (and 
                    (vampire-is-alive)
                    (vampire-is-in ?room)
                    (not(light-on ?room))
                    (light-on ?anti-clockwise-neighbor)
                )
                ;Consequence
                (and 
                    (not(vampire-is-in ?room)) 
                    (vampire-is-in ?clockwise-neighbor)
                    ;Check for fight
                    (when
                        ;Antecedent
                        (and 
                            (slayer-is-alive)
                            (slayer-is-in ?clockwise-neighbor)
                        )
                        ;Consequence
                        (and 
                            (fighting)
                        )
                    )
                )
            )
            ;; Switching off - Move slayer anti clockwise
            (when
                ;Antecedent
                (and 
                    (slayer-is-alive)
                    (slayer-is-in ?room)
                    (light-on ?room)
                    (not(light-on ?clockwise-neighbor))
                )
                ;Consequence
                (and 
                    (not(slayer-is-in ?room)) 
                    (slayer-is-in ?anti-clockwise-neighbor)
                    ;Check for fight
                    (when
                        ;Antecedent
                        (and 
                            (vampire-is-alive)
                            (vampire-is-in ?anti-clockwise-neighbor)    
                        )
                        ;Consequence
                        (and 
                            (fighting)
                        )    
                    )
                )
            )
            ;; Switching off - Move slayer clockwise
            (when
                ;Antecedent
                (and 
                    (slayer-is-alive)
                    (slayer-is-in ?room)
                    (light-on ?room)
                    (light-on ?clockwise-neighbor)
                )
                ;Consequence
                (and 
                    (not(slayer-is-in ?room)) 
                    (slayer-is-in ?clockwise-neighbor)
                    ;Check for fight
                    (when
                        ;Antecedent
                        (and 
                            (vampire-is-alive)
                            (vampire-is-in ?clockwise-neighbor)
                        )
                        ;Consequence
                        (and 
                            (fighting)
                        )
                    )
                )
            )
        )
    )

    (:action watch-fight
        :parameters (?room)
        :precondition (and
            (slayer-is-in ?room)
            (slayer-is-alive)
            (vampire-is-in ?room)
            (vampire-is-alive)
            (fighting)
        )
        :effect (and
            ;; Vampire wins
            (when
                ;Antecedent
                (and (not(light-on ?room))
                     (not(CONTAINS-GARLIC ?room)))
                ;Consequence
                (and (not(slayer-is-alive))
                     (not(fighting)))
            )
            ;; Slayer wins
            (when
                ;Antecedent
                (or  (light-on ?room)
                     (CONTAINS-GARLIC ?room))
                ;Consequence
                (and (not(vampire-is-alive))
                     (not(fighting)))
            )
        )
    )
)
