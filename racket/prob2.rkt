#lang racket

(require "nums.rkt")

(define (prob2 limit)
  (let loop ([f fib]
             [sum 0])
    (let ([n (stream-first f)])
      (if (>= n limit)
          sum
          (loop (stream-rest f) (+ sum (if (even? n) n 0)))))))
