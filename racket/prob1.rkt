#lang racket

(define (prob1 limit)
    (define (helper i sum)
      (if (= i limit)
          sum
          (helper (+ i 1)
                  (+ sum
                     (if (or (= (modulo i 3) 0) (= (modulo i 5) 0)) i 0)))))
    (helper 1 0))