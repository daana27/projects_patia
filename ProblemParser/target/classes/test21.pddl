(define (problem test21)
(:domain SOKOBAN)
(:objects
dir-nord - direction 
dir-sud - direction 
dir-est - direction
dir-ouest - direction
player - guard
pos-1-1 - location
pos-1-2 - location
pos-2-1 - location
pos-2-2 - location
pos-2-4 - location
pos-2-5 - location
pos-3-1 - location
pos-3-4 - location
pos-3-5 - location
pos-4-3 - location
pos-4-4 - location
pos-4-5 - location
pos-5-2 - location
pos-5-3 - location
pos-5-4 - location
pos-5-5 - location
pos-6-2 - location
pos-6-4 - location
pos-6-5 - location
pos-6-6 - location
pos-7-2 - location
pos-7-3 - location
pos-7-4 - location
pos-7-5 - location
pos-7-6 - location
pos-7-7 - location
pos-7-8 - location
pos-8-5 - location
pos-8-6 - location
pos-8-7 - location
pos-8-8 - location
pos-9-1 - location
pos-9-2 - location
pos-9-3 - location
box-1 - box
box-2 - box
box-3 - box
box-4 - box
box-5 - box
)
(:init
(goal pos-4-5)
(goal pos-5-3)
(goal pos-5-5)
(goal pos-6-5)
(goal pos-7-3)
(notgoal pos-1-1)
(notgoal pos-1-2)
(notgoal pos-2-1)
(notgoal pos-2-2)
(notgoal pos-2-4)
(notgoal pos-2-5)
(notgoal pos-3-1)
(notgoal pos-3-4)
(notgoal pos-3-5)
(notgoal pos-4-3)
(notgoal pos-4-4)
(notgoal pos-5-2)
(notgoal pos-5-4)
(notgoal pos-6-2)
(notgoal pos-6-4)
(notgoal pos-6-6)
(notgoal pos-7-2)
(notgoal pos-7-4)
(notgoal pos-7-5)
(notgoal pos-7-6)
(notgoal pos-7-7)
(notgoal pos-7-8)
(notgoal pos-8-5)
(notgoal pos-8-6)
(notgoal pos-8-7)
(notgoal pos-8-8)
(notgoal pos-9-1)
(notgoal pos-9-2)
(notgoal pos-9-3)
(deplacement pos-1-1 pos-2-1 dir-sud)
(deplacement pos-1-1 pos-1-2 dir-est)
(deplacement pos-1-2 pos-2-2 dir-sud)
(deplacement pos-1-2 pos-1-1 dir-ouest)
(deplacement pos-2-1 pos-3-1 dir-sud)
(deplacement pos-2-1 pos-1-1 dir-nord)
(deplacement pos-2-1 pos-2-2 dir-est)
(deplacement pos-2-2 pos-1-2 dir-nord)
(deplacement pos-2-2 pos-2-1 dir-ouest)
(deplacement pos-2-4 pos-3-4 dir-sud)
(deplacement pos-2-4 pos-2-5 dir-est)
(deplacement pos-2-5 pos-3-5 dir-sud)
(deplacement pos-2-5 pos-2-4 dir-ouest)
(deplacement pos-3-1 pos-2-1 dir-nord)
(deplacement pos-3-4 pos-4-4 dir-sud)
(deplacement pos-3-4 pos-2-4 dir-nord)
(deplacement pos-3-4 pos-3-5 dir-est)
(deplacement pos-3-5 pos-4-5 dir-sud)
(deplacement pos-3-5 pos-2-5 dir-nord)
(deplacement pos-3-5 pos-3-4 dir-ouest)
(deplacement pos-4-3 pos-5-3 dir-sud)
(deplacement pos-4-3 pos-4-4 dir-est)
(deplacement pos-4-4 pos-5-4 dir-sud)
(deplacement pos-4-4 pos-3-4 dir-nord)
(deplacement pos-4-4 pos-4-5 dir-est)
(deplacement pos-4-4 pos-4-3 dir-ouest)
(deplacement pos-4-5 pos-5-5 dir-sud)
(deplacement pos-4-5 pos-3-5 dir-nord)
(deplacement pos-4-5 pos-4-4 dir-ouest)
(deplacement pos-5-2 pos-6-2 dir-sud)
(deplacement pos-5-2 pos-5-3 dir-est)
(deplacement pos-5-3 pos-4-3 dir-nord)
(deplacement pos-5-3 pos-5-4 dir-est)
(deplacement pos-5-3 pos-5-2 dir-ouest)
(deplacement pos-5-4 pos-6-4 dir-sud)
(deplacement pos-5-4 pos-4-4 dir-nord)
(deplacement pos-5-4 pos-5-5 dir-est)
(deplacement pos-5-4 pos-5-3 dir-ouest)
(deplacement pos-5-5 pos-6-5 dir-sud)
(deplacement pos-5-5 pos-4-5 dir-nord)
(deplacement pos-5-5 pos-5-4 dir-ouest)
(deplacement pos-6-2 pos-7-2 dir-sud)
(deplacement pos-6-2 pos-5-2 dir-nord)
(deplacement pos-6-4 pos-7-4 dir-sud)
(deplacement pos-6-4 pos-5-4 dir-nord)
(deplacement pos-6-4 pos-6-5 dir-est)
(deplacement pos-6-5 pos-7-5 dir-sud)
(deplacement pos-6-5 pos-5-5 dir-nord)
(deplacement pos-6-5 pos-6-6 dir-est)
(deplacement pos-6-5 pos-6-4 dir-ouest)
(deplacement pos-6-6 pos-7-6 dir-sud)
(deplacement pos-6-6 pos-6-5 dir-ouest)
(deplacement pos-7-2 pos-6-2 dir-nord)
(deplacement pos-7-2 pos-7-3 dir-est)
(deplacement pos-7-3 pos-7-4 dir-est)
(deplacement pos-7-3 pos-7-2 dir-ouest)
(deplacement pos-7-4 pos-6-4 dir-nord)
(deplacement pos-7-4 pos-7-5 dir-est)
(deplacement pos-7-4 pos-7-3 dir-ouest)
(deplacement pos-7-5 pos-8-5 dir-sud)
(deplacement pos-7-5 pos-6-5 dir-nord)
(deplacement pos-7-5 pos-7-6 dir-est)
(deplacement pos-7-5 pos-7-4 dir-ouest)
(deplacement pos-7-6 pos-8-6 dir-sud)
(deplacement pos-7-6 pos-6-6 dir-nord)
(deplacement pos-7-6 pos-7-7 dir-est)
(deplacement pos-7-6 pos-7-5 dir-ouest)
(deplacement pos-7-7 pos-8-7 dir-sud)
(deplacement pos-7-7 pos-7-8 dir-est)
(deplacement pos-7-7 pos-7-6 dir-ouest)
(deplacement pos-7-8 pos-8-8 dir-sud)
(deplacement pos-7-8 pos-7-7 dir-ouest)
(deplacement pos-8-5 pos-7-5 dir-nord)
(deplacement pos-8-5 pos-8-6 dir-est)
(deplacement pos-8-6 pos-7-6 dir-nord)
(deplacement pos-8-6 pos-8-7 dir-est)
(deplacement pos-8-6 pos-8-5 dir-ouest)
(deplacement pos-8-7 pos-7-7 dir-nord)
(deplacement pos-8-7 pos-8-8 dir-est)
(deplacement pos-8-7 pos-8-6 dir-ouest)
(deplacement pos-8-8 pos-7-8 dir-nord)
(deplacement pos-8-8 pos-8-7 dir-ouest)
(deplacement pos-9-1 pos-9-2 dir-est)
(deplacement pos-9-2 pos-9-3 dir-est)
(deplacement pos-9-2 pos-9-1 dir-ouest)
(deplacement pos-9-3 pos-9-2 dir-ouest)
(at player pos-6-2)
(atgoal box-1)
(atgoal box-2)
(atgoal box-4)
(atgoal box-5)
(at box-1 pos-5-3)
(at box-2 pos-5-5)
(at box-3 pos-6-4)
(at box-4 pos-6-5)
(at box-5 pos-7-3)
(clear pos-1-1)
(clear pos-1-2)
(clear pos-2-1)
(clear pos-2-2)
(clear pos-2-4)
(clear pos-2-5)
(clear pos-3-1)
(clear pos-3-4)
(clear pos-3-5)
(clear pos-4-3)
(clear pos-4-4)
(clear pos-4-5)
(clear pos-5-2)
(clear pos-5-4)
(clear pos-6-6)
(clear pos-7-2)
(clear pos-7-4)
(clear pos-7-5)
(clear pos-7-6)
(clear pos-7-7)
(clear pos-7-8)
(clear pos-8-5)
(clear pos-8-6)
(clear pos-8-7)
(clear pos-8-8)
(clear pos-9-1)
(clear pos-9-2)
(clear pos-9-3)
)
(:goal (and
(atgoal box-1)
(atgoal box-2)
(atgoal box-3)
(atgoal box-4)
(atgoal box-5)
))
)
