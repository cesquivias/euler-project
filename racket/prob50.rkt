#lang racket

(require "primes.rkt")

(define (longest-prime-sum-iter ps limit)
  (define-values (_ __ max-sum max-len)
    (for/fold ([sum 0]
               [len 0]
               [max-sum 0]
               [max-len 0])
      ([p ps]
       #:break (> (+ sum p) limit))
      (define s (+ sum p))
      (define l (add1 len))
      (if (prime? s)
          (values s l s l)
          (values s l max-sum max-len))))
  (values max-sum max-len))

(define (longest-prime-sum limit)
  (let loop ([ps primes]
             [max-sum 0]
             [max-len 0])
    (define p (stream-first ps))
    (if (> p limit)
        (values max-sum max-len)
        (let-values ([(sum len) (longest-prime-sum-iter ps limit)])
          (if (> len max-len)
              (loop (stream-rest ps)
                    sum
                    len)
              (loop (stream-rest ps)
                    max-sum
                    max-len))))))

(define (prob50)
  (longest-prime-sum 1000000))
