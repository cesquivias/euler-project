#lang racket

(require racket/stream)
(require "streams.rkt")

(define (two+ i)
  (+ i 2))

(define primes
  (stream-cons 
   2
   (let loop ([candidate 3]
              [p primes])
     (let ([limit (integer-sqrt candidate)]
           [current-prime (stream-first p)])
       (if (> current-prime limit)
           (stream-cons candidate (loop (two+ candidate) primes))
           (begin
             (if (= (modulo candidate current-prime) 0)
                 (loop (two+ candidate) primes)
                 (loop candidate (stream-rest p)))))))))

(define (prime-factors num)
  (let loop ([n num]
             [factors '()])
    (if (= n 1)
        factors
        (let next-prime ([p primes])
          (if (= (modulo n (stream-first p)) 0)
              (loop (/ n (stream-first p)) (cons (stream-first p) factors))
              (next-prime (stream-rest p)))))))

(define (max-prime-factor num)
  (apply max (prime-factors num)))

(define prob3 max-prime-factor)