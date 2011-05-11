#lang racket

(define (proper-divisors num)
  (for/fold ([divisors '(1)])
    ([i (in-range 2 (add1 (quotient num 2)))]
     #:when (= (modulo num i) 0))
    (values (cons i divisors))))

(define (d num)
  (apply + (proper-divisors num)))

(define (amicable? a)
  (let ([b (d a)])
    (and (not (= a b)) (= a (d b)))))

(define (prob21 limit)
  (for/fold ([sum 0])
    ([i (in-range 2 limit)]
     #:when (amicable? i))
    (values (+ sum i))))
