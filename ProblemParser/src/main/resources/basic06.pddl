(define (problem basic06)
(:domain SOKOBAN)
(:objects
dir-nord - direction 
dir-sud - direction 
dir-est - direction
dir-ouest - direction
player - guard
pos-2-3 - location
pos-2-4 - location
pos-2-5 - location
pos-2-6 - location
pos-2-7 - location
pos-2-8 - location
pos-3-2 - location
pos-3-3 - location
pos-3-5 - location
pos-3-7 - location
pos-3-8 - location
pos-4-2 - location
pos-4-3 - location
pos-4-5 - location
pos-4-7 - location
pos-4-8 - location
pos-5-2 - location
pos-5-3 - location
pos-5-4 - location
pos-5-5 - location
pos-5-6 - location
pos-5-7 - location
pos-5-8 - location
pos-6-2 - location
pos-6-3 - location
pos-6-4 - location
pos-6-5 - location
pos-6-6 - location
pos-6-7 - location
pos-6-8 - location
box-1 - box
box-2 - box
)
(:init
(goal pos-3-7)
(goal pos-4-7)
(notgoal pos-2-3)
(notgoal pos-2-4)
(notgoal pos-2-5)
(notgoal pos-2-6)
(notgoal pos-2-7)
(notgoal pos-2-8)
(notgoal pos-3-2)
(notgoal pos-3-3)
(notgoal pos-3-5)
(notgoal pos-3-8)
(notgoal pos-4-2)
(notgoal pos-4-3)
(notgoal pos-4-5)
(notgoal pos-4-8)
(notgoal pos-5-2)
(notgoal pos-5-3)
(notgoal pos-5-4)
(notgoal pos-5-5)
(notgoal pos-5-6)
(notgoal pos-5-7)
(notgoal pos-5-8)
(notgoal pos-6-2)
(notgoal pos-6-3)
(notgoal pos-6-4)
(notgoal pos-6-5)
(notgoal pos-6-6)
(notgoal pos-6-7)
(notgoal pos-6-8)
(deplacement pos-2-3 pos-3-3 dir-sud)
(deplacement pos-2-3 pos-2-4 dir-est)
(deplacement pos-2-4 pos-2-5 dir-est)
(deplacement pos-2-4 pos-2-3 dir-ouest)
(deplacement pos-2-5 pos-3-5 dir-sud)
(deplacement pos-2-5 pos-2-6 dir-est)
(deplacement pos-2-5 pos-2-4 dir-ouest)
(deplacement pos-2-6 pos-2-7 dir-est)
(deplacement pos-2-6 pos-2-5 dir-ouest)
(deplacement pos-2-7 pos-3-7 dir-sud)
(deplacement pos-2-7 pos-2-8 dir-est)
(deplacement pos-2-7 pos-2-6 dir-ouest)
(deplacement pos-2-8 pos-3-8 dir-sud)
(deplacement pos-2-8 pos-2-7 dir-ouest)
(deplacement pos-3-2 pos-4-2 dir-sud)
(deplacement pos-3-2 pos-3-3 dir-est)
(deplacement pos-3-3 pos-4-3 dir-sud)
(deplacement pos-3-3 pos-2-3 dir-nord)
(deplacement pos-3-3 pos-3-2 dir-ouest)
(deplacement pos-3-5 pos-4-5 dir-sud)
(deplacement pos-3-5 pos-2-5 dir-nord)
(deplacement pos-3-7 pos-4-7 dir-sud)
(deplacement pos-3-7 pos-2-7 dir-nord)
(deplacement pos-3-7 pos-3-8 dir-est)
(deplacement pos-3-8 pos-4-8 dir-sud)
(deplacement pos-3-8 pos-2-8 dir-nord)
(deplacement pos-3-8 pos-3-7 dir-ouest)
(deplacement pos-4-2 pos-5-2 dir-sud)
(deplacement pos-4-2 pos-3-2 dir-nord)
(deplacement pos-4-2 pos-4-3 dir-est)
(deplacement pos-4-3 pos-5-3 dir-sud)
(deplacement pos-4-3 pos-3-3 dir-nord)
(deplacement pos-4-3 pos-4-2 dir-ouest)
(deplacement pos-4-5 pos-5-5 dir-sud)
(deplacement pos-4-5 pos-3-5 dir-nord)
(deplacement pos-4-7 pos-5-7 dir-sud)
(deplacement pos-4-7 pos-3-7 dir-nord)
(deplacement pos-4-7 pos-4-8 dir-est)
(deplacement pos-4-8 pos-5-8 dir-sud)
(deplacement pos-4-8 pos-3-8 dir-nord)
(deplacement pos-4-8 pos-4-7 dir-ouest)
(deplacement pos-5-2 pos-6-2 dir-sud)
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
(deplacement pos-5-5 pos-4-5 dir-nord)
(deplacement pos-5-5 pos-5-6 dir-est)
(deplacement pos-5-5 pos-5-4 dir-ouest)
(deplacement pos-5-6 pos-6-6 dir-sud)
(deplacement pos-5-6 pos-5-7 dir-est)
(deplacement pos-5-6 pos-5-5 dir-ouest)
(deplacement pos-5-7 pos-6-7 dir-sud)
(deplacement pos-5-7 pos-4-7 dir-nord)
(deplacement pos-5-7 pos-5-8 dir-est)
(deplacement pos-5-7 pos-5-6 dir-ouest)
(deplacement pos-5-8 pos-6-8 dir-sud)
(deplacement pos-5-8 pos-4-8 dir-nord)
(deplacement pos-5-8 pos-5-7 dir-ouest)
(deplacement pos-6-2 pos-5-2 dir-nord)
(deplacement pos-6-2 pos-6-3 dir-est)
(deplacement pos-6-3 pos-5-3 dir-nord)
(deplacement pos-6-3 pos-6-4 dir-est)
(deplacement pos-6-3 pos-6-2 dir-ouest)
(deplacement pos-6-4 pos-5-4 dir-nord)
(deplacement pos-6-4 pos-6-5 dir-est)
(deplacement pos-6-4 pos-6-3 dir-ouest)
(deplacement pos-6-5 pos-5-5 dir-nord)
(deplacement pos-6-5 pos-6-6 dir-est)
(deplacement pos-6-5 pos-6-4 dir-ouest)
(deplacement pos-6-6 pos-5-6 dir-nord)
(deplacement pos-6-6 pos-6-7 dir-est)
(deplacement pos-6-6 pos-6-5 dir-ouest)
(deplacement pos-6-7 pos-5-7 dir-nord)
(deplacement pos-6-7 pos-6-8 dir-est)
(deplacement pos-6-7 pos-6-6 dir-ouest)
(deplacement pos-6-8 pos-5-8 dir-nord)
(deplacement pos-6-8 pos-6-7 dir-ouest)
(at player pos-3-7)
(goal pos-3-7)
(at box-1 pos-3-5)
(at box-2 pos-4-3)
(clear pos-2-3)
(clear pos-2-4)
(clear pos-2-5)
(clear pos-2-6)
(clear pos-2-7)
(clear pos-2-8)
(clear pos-3-2)
(clear pos-3-3)
(clear pos-3-8)
(clear pos-4-2)
(clear pos-4-5)
(clear pos-4-7)
(clear pos-4-8)
(clear pos-5-2)
(clear pos-5-3)
(clear pos-5-4)
(clear pos-5-5)
(clear pos-5-6)
(clear pos-5-7)
(clear pos-5-8)
(clear pos-6-2)
(clear pos-6-3)
(clear pos-6-4)
(clear pos-6-5)
(clear pos-6-6)
(clear pos-6-7)
(clear pos-6-8)
)
(:goal (and
(atgoal box-1)
(atgoal box-2)
))
)
