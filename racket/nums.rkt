#lang racket

(require racket/stream)

(provide fib !)

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
