#lang racket

(require "nums.rkt")

(define (take-while s pred)
  (let loop ([s s])
    (define item (stream-first s))
    (if (pred item)
        (stream-cons item (loop (stream-rest s)))
        '())))

(define abundant-cache (make-hash))

(define abundant-numbers
  (let loop ([i 12])
    (if (> (sum (proper-divisors i)) i)
        (stream-cons i (loop (add1 i)))
        (loop (add1 i)))))

(define (sum-of-two-abundant-numbers? num)
  (for/or ([a (take-while abundant-numbers (λ [n] (< n (- num 11))))])
    (hash-ref abundant-cache (- num a) #f)))

(define (prob23 limit)
  (for ([n (take-while abundant-numbers (λ [n] (< n limit)))])
    (hash-set! abundant-cache n #t))
  (for/fold ([sum 0])
    ([i (in-range limit)]
     #:when (not (sum-of-two-abundant-numbers? i)))
    (values (+ sum i))))
