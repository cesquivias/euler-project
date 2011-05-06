#lang racket

(provide stream-nth)

(define (stream-nth st n)
    (let loop ([i n]
               [s st])
      (if (= i 0)
          (stream-first s)
          (loop (- i 1) (stream-rest s)))))
