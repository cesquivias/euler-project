#lang racket

(require racket/stream)
(require "streams.rkt")
(require "primes.rkt")

(define (max-prime-factor num)
  (apply max (prime-factors num)))

(define prob3 max-prime-factor)
