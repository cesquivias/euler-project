#lang racket

(require "primes.rkt")

(define triangle-numbers
  (let loop ([i 2]
             [sum 1])
    (stream-cons sum (loop (add1 i) (+ sum i)))))

(define (num-divisors n)
  (define factors (make-hash))
  (define (compute-num-divisors)
    ;(displayln (hash-values factors))
    (foldl * 1 (map add1 (hash-values factors))))
  (let loop ([num n]
             [primes primes])
    (define prime (stream-first primes))
    ;;;(printf "num=~a, prime=~a~n" num prime)
    (cond ((= num 1) (compute-num-divisors))
          ((= (modulo num prime) 0)
           (begin
             (hash-update! factors prime add1 0)
             (loop (/ num prime) primes)))
          (else (loop num (stream-rest primes))))))


(define (prob12 target-num-divisors)
  (let loop ([t triangle-numbers])
    (if (> (num-divisors (stream-first t)) target-num-divisors)
        (stream-first t)
        (loop (stream-rest t)))))