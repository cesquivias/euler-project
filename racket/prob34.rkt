#lang racket

(define (! n)
  (if (= n 0)
      1
      (stream-fold * 1 (in-range 1 (add1 n)))))

(define (sum-factorial=? n)
  (= n (for/fold ([sum 0])
           ([c (number->string n)])
         (+ sum (! (- (char->integer c) 48))))))

(define (prob34 max)
  (for/fold ([sum 0])
      ([i (in-range 3 max)]
       #:when (sum-factorial=? i))
    (+ sum i)))
