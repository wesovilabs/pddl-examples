; domain definitio for the problem
(define (domain hospital-ambulance-patient)
    (:requirements :strips :equality :typing  :negative-preconditions :disjunctive-preconditions)
    
    (:types 
        item location - object
        ambulance  patient - item
    )
   
    (:predicates
        ; It's True if the item is the location,
        ; otherwise  is false
        (at ?a - item ?loc - location)
        ; It is True if the ambulance doesn't carry a patient, 
        ; otherwise it's False.
        (isFree ?a - ambulance)
        ; It's True if the patiente is carried by the ambulance,
        ; otherwise it's False
        (on ?p - patient ?a - ambulance)
        ; It's True if the two locations are linked,
        ; otherwise it's False
        (link ?loc1 - location ?loc2 - location)
        ; It's True if the hospital is in the position, otherwise it's False.
        (hospital ?loc - location)
    )
    
    (:action move
        :parameters(
            ?a - ambulance 
            ?from - location 
            ?to - location
        )
        :precondition( and
            (at ?a ?from)
            (or 
                (link ?from ?to) 
                (link ?to ?from)
            )
        )
        :effect( and
            (not(at ?a ?from))
            (at ?a ?to)
        )
    )
    
    (:action pick
        :parameters(?a - ambulance ?p - patient ?loc - location)
        :precondition ( and
            (at ?a ?loc)
            (at ?p ?loc) 
            (isFree ?a)
            (not (hospital ?loc))
            
        )
        :effect (and
            (not (at ?p ?loc))
            (not (isFree ?a))
            (on ?p ?a)
        )
    )
    
    (:action drop
        :parameters(?a - ambulance ?p - patient ?loc - location)
        :precondition( and
            (hospital ?loc)
            (not (isFree ?a) )
            (at ?a ?loc)
            (on ?p ?a)
        )
        :effect( and
            (isFree ?a)    
            (at ?p ?loc)
            (not (on ?p ?a))
        )
    )

)