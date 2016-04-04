#lang racket

(define (pandigital? digits)
  (for/and ([d (sort digits <)]
            [i 10])
    (= d i)))

(define (divisible-by? d)
  (λ (n) (= (remainder n d) 0)))

(define divisible-by-3? (divisible-by? 3))
(define divisible-by-7? (divisible-by? 7))
(define divisible-by-11? (divisible-by? 11))
(define divisible-by-13? (divisible-by? 13))
(define divisible-by-17? (divisible-by? 17))

(prob43 ()
        (for*/sum ([d1 (in-range 1 10)]
                   [d2 10]
                   [d3 10]
                   [d4 (in-range 0 9 2)]
                   [d5 10]
                   #:when (divisible-by-3? (+ (* 100 d3) (* 10 d4) d5))
                   (d6 '(0 5))
                   (d7 10)
                   #:when (divisible-by-7? (+ (* 100 d5) (* 10 d6) d7))
                   (d8 10)
                   #:when (divisible-by-11? (+ (* 100 d6) (* 10 d7) d8))
                   (d9 10)
                   #:when (divisible-by-13? (+ (* 100 d7) (* 10 d8) d9))
                   (d10 10)
                   #:when (divisible-by-17? (+ (* 100 d8) (* 10 d9) d10))
                   #:when (pandigital? (list d1 d2 d3 d4 d5 d6 d7 d8 d9 d10)))
          (+ d10
             (* 10 d9)
             (* 100 d8)
             (* 1000 d7)
             (* 10000 d6)
             (* 100000 d5)
             (* 1000000 d4)
             (* 10000000 d3)
             (* 100000000 d2)
             (* 1000000000 d1)))
        )