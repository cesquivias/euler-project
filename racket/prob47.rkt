#lang racket

(require racket/set)
(require "primes.rkt")

(define cache (make-hash))

(define (num-distinct-prime-factors num)
  (if (hash-has-key? cache num)
      (hash-ref cache num)
      (let loop [(n num)
                 (factors (set))]
        (if (= n 1)
            (begin
              (hash-set! cache num (set-count factors))
              (set-count factors))
            (let [(p (for/first ([p primes]
                                 #:when (= 0 (remainder n p)))
                       p))]
              (loop (quotient n p) (set-add factors p)))))))

(define (prob47 length)
  (for/first [(start (in-naturals 2))
              #:when (for/and [(i length)]
                       (= length (num-distinct-prime-factors (+ start i))))]
    start))
