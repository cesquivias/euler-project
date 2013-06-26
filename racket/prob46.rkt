#lang racket

(require "primes.rkt")

(define (square x)
  (* x x))

(define (golbach? num)
  (for/or ([p primes]
           #:break (> p num))
    (define r (- num p))
    (and (even? r)
         (let [(h (quotient r 2))]
           (= h (square (integer-sqrt h)))))))

(define (prob46)
  (for/first [(i (in-naturals 9))
              #:when (and (odd? i)
                          (not (prime? i)))
              #:when (not (golbach? i))]
    i))
