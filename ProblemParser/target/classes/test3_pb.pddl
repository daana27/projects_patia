(define (problem test3)
(:domain SOKOBAN)
(:objects
dir-nord - direction 
dir-sud - direction 
dir-est - direction
dir-ouest - direction
player - guard
pos-1-1 - location
pos-2-1 - location
pos-2-3 - location
pos-2-4 - location
pos-3-3 - location
pos-3-4 - location
pos-4-4 - location
pos-4-5 - location
pos-5-1 - location
pos-5-2 - location
pos-5-3 - location
pos-6-1 - location
pos-6-3 - location
pos-6-4 - location
pos-6-5 - location
pos-7-3 - location
pos-7-4 - location
pos-7-5 - location
pos-8-1 - location
pos-9-2 - location
pos-9-3 - location
pos-9-5 - location
pos-10-1 - location
box-1 - box
box-2 - box
box-3 - box
)
(:init
(goal pos-3-4)
(goal pos-5-1)
(goal pos-6-3)
(notgoal pos-1-1)
(notgoal pos-2-1)
(notgoal pos-2-3)
(notgoal pos-2-4)
(notgoal pos-3-3)
(notgoal pos-4-4)
(notgoal pos-4-5)
(notgoal pos-5-2)
(notgoal pos-5-3)
(notgoal pos-6-1)
(notgoal pos-6-4)
(notgoal pos-6-5)
(notgoal pos-7-3)
(notgoal pos-7-4)
(notgoal pos-7-5)
(notgoal pos-8-1)
(notgoal pos-9-2)
(notgoal pos-9-3)
(notgoal pos-9-5)
(notgoal pos-10-1)
(deplacement pos-1-1 pos-2-1 dir-sud)
(deplacement pos-2-1 pos-1-1 dir-nord)
(deplacement pos-2-3 pos-3-3 dir-sud)
(deplacement pos-2-3 pos-2-4 dir-est)
(deplacement pos-2-4 pos-3-4 dir-sud)
(deplacement pos-2-4 pos-2-3 dir-ouest)
(deplacement pos-3-3 pos-2-3 dir-nord)
(deplacement pos-3-3 pos-3-4 dir-est)
(deplacement pos-3-4 pos-4-4 dir-sud)
(deplacement pos-3-4 pos-2-4 dir-nord)
(deplacement pos-3-4 pos-3-3 dir-ouest)
(deplacement pos-4-4 pos-3-4 dir-nord)
(deplacement pos-4-4 pos-4-5 dir-est)
(deplacement pos-4-5 pos-4-4 dir-ouest)
(deplacement pos-5-1 pos-6-1 dir-sud)
(deplacement pos-5-1 pos-5-2 dir-est)
(deplacement pos-5-2 pos-5-3 dir-est)
(deplacement pos-5-2 pos-5-1 dir-ouest)
(deplacement pos-5-3 pos-6-3 dir-sud)
(deplacement pos-5-3 pos-5-2 dir-ouest)
(deplacement pos-6-1 pos-5-1 dir-nord)
(deplacement pos-6-3 pos-7-3 dir-sud)
(deplacement pos-6-3 pos-5-3 dir-nord)
(deplacement pos-6-3 pos-6-4 dir-est)
(deplacement pos-6-4 pos-7-4 dir-sud)
(deplacement pos-6-4 pos-6-5 dir-est)
(deplacement pos-6-4 pos-6-3 dir-ouest)
(deplacement pos-6-5 pos-7-5 dir-sud)
(deplacement pos-6-5 pos-6-4 dir-ouest)
(deplacement pos-7-3 pos-6-3 dir-nord)
(deplacement pos-7-3 pos-7-4 dir-est)
(deplacement pos-7-4 pos-6-4 dir-nord)
(deplacement pos-7-4 pos-7-5 dir-est)
(deplacement pos-7-4 pos-7-3 dir-ouest)
(deplacement pos-7-5 pos-6-5 dir-nord)
(deplacement pos-7-5 pos-7-4 dir-ouest)
(deplacement pos-9-2 pos-9-3 dir-est)
(deplacement pos-9-3 pos-9-2 dir-ouest)
(at player pos-2-4)
(atgoal box-2)
(at box-1 pos-3-3)
(at box-2 pos-3-4)
(at box-3 pos-7-4)
(clear pos-1-1)
(clear pos-2-1)
(clear pos-2-3)
(clear pos-4-4)
(clear pos-4-5)
(clear pos-5-1)
(clear pos-5-2)
(clear pos-5-3)
(clear pos-6-1)
(clear pos-6-3)
(clear pos-6-4)
(clear pos-6-5)
(clear pos-7-3)
(clear pos-7-5)
(clear pos-8-1)
(clear pos-9-2)
(clear pos-9-3)
(clear pos-9-5)
(clear pos-10-1)
)
(:goal (and
(atgoal box-1)
(atgoal box-2)
(atgoal box-3)
))
)
