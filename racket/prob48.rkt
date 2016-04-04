#lang racket

(define (prob48)
  (remainder (for/fold ([sum 0])
                 ([i (in-range 1 1001)])
               (+ sum (expt i i)))
             10000000000))
