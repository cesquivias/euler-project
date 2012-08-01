#lang racket

(require "nums.rkt")
(require "primes.rkt")

(define (prob37)
  (let loop ([truncatable-primes '()]
             [prime-stream (stream-tail primes 4)])
    (if (= (length truncatable-primes) 11)
        (sum truncatable-primes)
        (let ([prime (stream-first prime-stream)])
          (if (truncatable-prime? prime)
              (loop (cons prime truncatable-primes) (stream-rest prime-stream))
              (loop truncatable-primes (stream-rest prime-stream)))))))

(define (truncatable-prime? p)
  (and (right-truncatable-prime? p)
       (left-truncatable-prime? p)))

(define (right-truncatable-prime? p)
  (let loop ([n (quotient p 10)])
    (cond [(zero? n) #t]
          [(prime? n) (loop (quotient n 10))]
          [else #f])))

(define (left-truncatable-prime? p)
  (let loop ([dlist (rest (number->digits p))])
    (cond [(empty? dlist) #t]
          [(prime? (digits->number dlist)) (loop (rest dlist))]
          [else #f])))
