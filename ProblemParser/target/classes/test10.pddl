(define (problem test10)
(:domain SOKOBAN)
(:objects
dir-nord - direction 
dir-sud - direction 
dir-est - direction
dir-ouest - direction
player - guard
pos-2-2 - location
pos-2-3 - location
pos-2-4 - location
pos-3-4 - location
pos-3-5 - location
pos-4-1 - location
pos-4-2 - location
pos-4-3 - location
pos-5-2 - location
pos-5-3 - location
pos-5-4 - location
pos-5-5 - location
pos-6-3 - location
pos-6-4 - location
pos-6-5 - location
pos-7-2 - location
pos-7-5 - location
pos-8-1 - location
pos-8-2 - location
pos-8-3 - location
pos-8-4 - location
box-1 - box
box-2 - box
box-3 - box
)
(:init
(goal pos-5-2)
(goal pos-5-4)
(goal pos-6-4)
(notgoal pos-2-2)
(notgoal pos-2-3)
(notgoal pos-2-4)
(notgoal pos-3-4)
(notgoal pos-3-5)
(notgoal pos-4-1)
(notgoal pos-4-2)
(notgoal pos-4-3)
(notgoal pos-5-3)
(notgoal pos-5-5)
(notgoal pos-6-3)
(notgoal pos-6-5)
(notgoal pos-7-2)
(notgoal pos-7-5)
(notgoal pos-8-1)
(notgoal pos-8-2)
(notgoal pos-8-3)
(notgoal pos-8-4)
(deplacement pos-2-2 pos-2-3 dir-est)
(deplacement pos-2-3 pos-2-4 dir-est)
(deplacement pos-2-3 pos-2-2 dir-ouest)
(deplacement pos-2-4 pos-3-4 dir-sud)
(deplacement pos-2-4 pos-2-3 dir-ouest)
(deplacement pos-3-4 pos-2-4 dir-nord)
(deplacement pos-3-4 pos-3-5 dir-est)
(deplacement pos-3-5 pos-3-4 dir-ouest)
(deplacement pos-4-1 pos-4-2 dir-est)
(deplacement pos-4-2 pos-5-2 dir-sud)
(deplacement pos-4-2 pos-4-3 dir-est)
(deplacement pos-4-2 pos-4-1 dir-ouest)
(deplacement pos-4-3 pos-5-3 dir-sud)
(deplacement pos-4-3 pos-4-2 dir-ouest)
(deplacement pos-5-2 pos-4-2 dir-nord)
(deplacement pos-5-2 pos-5-3 dir-est)
(deplacement pos-5-3 pos-6-3 dir-sud)
(deplacement pos-5-3 pos-4-3 dir-nord)
(deplacement pos-5-3 pos-5-4 dir-est)
(deplacement pos-5-3 pos-5-2 dir-ouest)
(deplacement pos-5-4 pos-6-4 dir-sud)
(deplacement pos-5-4 pos-5-5 dir-est)
(deplacement pos-5-4 pos-5-3 dir-ouest)
(deplacement pos-5-5 pos-6-5 dir-sud)
(deplacement pos-5-5 pos-5-4 dir-ouest)
(deplacement pos-6-3 pos-5-3 dir-nord)
(deplacement pos-6-3 pos-6-4 dir-est)
(deplacement pos-6-4 pos-5-4 dir-nord)
(deplacement pos-6-4 pos-6-5 dir-est)
(deplacement pos-6-4 pos-6-3 dir-ouest)
(deplacement pos-6-5 pos-7-5 dir-sud)
(deplacement pos-6-5 pos-5-5 dir-nord)
(deplacement pos-6-5 pos-6-4 dir-ouest)
(deplacement pos-7-2 pos-8-2 dir-sud)
(deplacement pos-7-5 pos-6-5 dir-nord)
(deplacement pos-8-1 pos-8-2 dir-est)
(deplacement pos-8-2 pos-7-2 dir-nord)
(deplacement pos-8-2 pos-8-3 dir-est)
(deplacement pos-8-2 pos-8-1 dir-ouest)
(deplacement pos-8-3 pos-8-4 dir-est)
(deplacement pos-8-3 pos-8-2 dir-ouest)
(deplacement pos-8-4 pos-8-3 dir-ouest)
(at player pos-4-1)
(atgoal box-2)
(atgoal box-3)
(at box-1 pos-3-5)
(at box-2 pos-5-2)
(at box-3 pos-6-4)
(clear pos-2-2)
(clear pos-2-3)
(clear pos-2-4)
(clear pos-3-4)
(clear pos-4-2)
(clear pos-4-3)
(clear pos-5-3)
(clear pos-5-4)
(clear pos-5-5)
(clear pos-6-3)
(clear pos-6-5)
(clear pos-7-2)
(clear pos-7-5)
(clear pos-8-1)
(clear pos-8-2)
(clear pos-8-3)
(clear pos-8-4)
)
(:goal (and
(atgoal box-1)
(atgoal box-2)
(atgoal box-3)
))
)
