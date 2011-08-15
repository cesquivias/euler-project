#lang racket

(define (prob1 limit)
  (let loop ([i 1]
             [sum 0])
    (if (= i limit)
        sum
        (loop (add1 i) (+ sum (if (or (= (modulo i 3) 0) (= (modulo i 5) 0))
                                  i 0))))))
