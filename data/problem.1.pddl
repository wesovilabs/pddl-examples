(define (problem patient-wating-to-be-attended)
  (:domain hospital-ambulance-patient)
  (:objects
    ambulance1  - ambulance
    patient1    - patient
    patient2    - patient
    loc1        - location
    loc2        - location
    loc3        - location
    loc4        - location
  )
  (:init 
    (link loc1 loc2)
    (link loc2 loc4)
    (link loc4 loc3)
    (at patient1 loc3)
    (at patient2 loc4)
    (at ambulance1 loc1)
    (isFree ambulance1)
    (hospital loc1)
   )


  (:goal (and 
     (at patient1 loc1)
     (at patient2 loc1)
  ))

)