#lang racket

(require "primes.rkt")

(define (prob10 limit)
  (let loop ([primes primes]
             [sum 0])
    (define p (stream-first primes))
    (if (>= p limit)
        sum
        (loop (stream-rest primes) (+ sum p)))))