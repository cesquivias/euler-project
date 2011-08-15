#lang racket

(require racket/stream)

(provide sum fib ! proper-divisors)

(define (sum nums)
  (foldl + 0 nums))

(define fib
  (let loop ([a 1]
             [b 2])
    (stream-cons a (loop b (+ a b)))))

(define (! n)
  (let loop ([n n]
             [prod 1])
    (if (= n 0)
        prod
        (loop (sub1 n) (* prod n)))))

(define (proper-divisors num)
  (for/fold ([divisors '(1)])
    ([i (in-range 2 (add1 (quotient num 2)))]
     #:when (= (modulo num i) 0))
    (values (cons i divisors))))
