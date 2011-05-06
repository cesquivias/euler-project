#lang racket

(require racket/stream)

(define fib
  (let loop ([a 1]
             [b 2])
    (stream-cons a (loop b (+ a b)))))

(define (prob2 limit)
  (let loop ([f fib]
             [sum 0])
    (let ([n (stream-first f)])
      (if (>= n limit)
          sum
          (loop (stream-rest f) (+ sum (if (even? n) n 0)))))))
