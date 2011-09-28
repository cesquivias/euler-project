#lang racket

(define (prob31-slow)
  (for*/fold
      ([total 1])
    ([c100 (in-range 0 201 100)]
     [c50 (in-range 0 201 50)]
     [c20 (in-range 0 201 20)]
     [c10 (in-range 0 201 10)]
     [c5 (in-range 0 201 5)]
     [c2 (in-range 0 201 2)]
     [c1 (in-range 0 201 1)])
    (if (= 200 (+ c100 c50 c20 c10 c5 c2 c1))
        (values (add1 total))
        (values total))))

