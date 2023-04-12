(define (problem testbis)
(:domain SOKOBAN)
(:objects
dir-nord - direction 
dir-sud - direction 
dir-est - direction
dir-ouest - direction
player - guard
pos-1-1 - location
pos-1-2 - location
pos-1-3 - location
pos-2-1 - location
pos-2-2 - location
pos-3-1 - location
pos-3-2 - location
pos-3-3 - location
pos-4-1 - location
pos-4-2 - location
pos-4-3 - location
box-1 - box
box-2 - box
)
(:init
(goal pos-3-2)
(goal pos-3-3)
(notgoal pos-1-1)
(notgoal pos-1-2)
(notgoal pos-1-3)
(notgoal pos-2-1)
(notgoal pos-2-2)
(notgoal pos-3-1)
(notgoal pos-4-1)
(notgoal pos-4-2)
(notgoal pos-4-3)
(deplacement pos-1-1 pos-2-1 dir-sud)
(deplacement pos-1-1 pos-1-2 dir-est)
(deplacement pos-1-2 pos-2-2 dir-sud)
(deplacement pos-1-2 pos-1-3 dir-est)
(deplacement pos-1-2 pos-1-1 dir-ouest)
(deplacement pos-1-3 pos-1-2 dir-ouest)
(deplacement pos-2-1 pos-3-1 dir-sud)
(deplacement pos-2-1 pos-1-1 dir-nord)
(deplacement pos-2-1 pos-2-2 dir-est)
(deplacement pos-2-2 pos-3-2 dir-sud)
(deplacement pos-2-2 pos-1-2 dir-nord)
(deplacement pos-2-2 pos-2-1 dir-ouest)
(deplacement pos-3-1 pos-4-1 dir-sud)
(deplacement pos-3-1 pos-2-1 dir-nord)
(deplacement pos-3-1 pos-3-2 dir-est)
(deplacement pos-3-2 pos-4-2 dir-sud)
(deplacement pos-3-2 pos-2-2 dir-nord)
(deplacement pos-3-2 pos-3-3 dir-est)
(deplacement pos-3-2 pos-3-1 dir-ouest)
(deplacement pos-3-3 pos-4-3 dir-sud)
(deplacement pos-3-3 pos-3-2 dir-ouest)
(deplacement pos-4-1 pos-3-1 dir-nord)
(deplacement pos-4-1 pos-4-2 dir-est)
(deplacement pos-4-2 pos-3-2 dir-nord)
(deplacement pos-4-2 pos-4-3 dir-est)
(deplacement pos-4-2 pos-4-1 dir-ouest)
(deplacement pos-4-3 pos-3-3 dir-nord)
(deplacement pos-4-3 pos-4-2 dir-ouest)
(at player pos-1-1)
(atgoal box-2)
(at box-1 pos-2-2)
(at box-2 pos-3-2)
(clear pos-1-2)
(clear pos-1-3)
(clear pos-2-1)
(clear pos-3-1)
(clear pos-3-3)
(clear pos-4-1)
(clear pos-4-2)
(clear pos-4-3)
)
(:goal (and
(atgoal box-1)
(atgoal box-2)
))
)
