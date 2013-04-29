#lang racket

(define (prob9 sum)
  (for*/first ([c (in-range 3 (- sum 2))]
               [b (in-range 2 c)]
               [a (in-range 1 b)]
               #:when (and (= (+ a b c) sum)
                           (= (+ (* a a) (* b b)) (* c c))))
    (* a b c)))
    