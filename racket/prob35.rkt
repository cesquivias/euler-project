#lang racket

(require "primes.rkt")

(define limit 1000000)

(define prime-map (for/hash ([i (in-range 2 limit)])
                    (values i (prime? i))))

(define (char->number c)
  (- (char->integer c) 48))

(define (circular-prime? n)
  (define digits (string->list (number->string n)))
  (let loop ([digits (append (rest digits) (list (car digits)))])
    (define num (string->number (list->string digits)))
    (cond [(= num n) #t]
          [(not (hash-ref prime-map num #f)) #f]
          [else (loop (append (rest digits) (list (car digits))))])))

(define (prob35)
  (for/sum ([i (in-range 2 limit)]
             #:when (hash-ref prime-map i)
             #:when (circular-prime? i))
    1))
