#lang racket

(require "streams.rkt")
(require "primes.rkt")

(define (prob7 nth-prime)
  (stream-nth primes (sub1 nth-prime)))
