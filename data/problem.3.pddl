(define (problem patient-wating-to-be-attended)
  (:domain hospital-ambulance-patient)
  (:objects
    ambulance1  - ambulance
    ambulance2  - ambulance
    patient1    - patient
    patient2    - patient
    patient3    - patient
    loc1        - location
    loc2        - location
    loc3        - location
    loc4        - location
    loc5        - location
    loc6        - location
    loc7        - location
    loc8        - location
    loc9        - location
  )
  (:init 
    (link loc1 loc2)
    (link loc2 loc3)
    (link loc4 loc3)
    (link loc3 loc4)
    (link loc3 loc6)
    (link loc4 loc5)
    (link loc5 loc7)
    (link loc5 loc8)
    (link loc6 loc7)
    (link loc8 loc1)
    (link loc8 loc9)
    (at patient1 loc1)
    (at patient2 loc3)
    (at patient3 loc9)
    (at ambulance1 loc2)
    (at ambulance2 loc7)
    (isFree ambulance1)
    (isFree ambulance2)
    (hospital loc7)
   )


  (:goal (and 
     (at patient1 loc7)
     (at patient2 loc7)
     (at patient3 loc7)
  ))

)

