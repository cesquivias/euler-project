#lang racket

(require "nums.rkt")

(define (prob25 limit-length)
  (let loop ([i 2]
             [f fib])
    (if (= (string-length (number->string (stream-first f))) limit-length)
        i
        (loop (add1 i) (stream-rest f)))))
