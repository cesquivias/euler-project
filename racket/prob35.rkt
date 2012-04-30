#lang racket

(require "primes.rkt")

(define limit 100)

(define prime-map (for/hash ([i (in-range 2 limit)])
                    (values i (prime? i))))