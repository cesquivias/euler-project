#lang racket

(define (triangle-number n)
  (quotient (* n (add1 n)) 2))

(define (pentagonal-number n)
  (quotient (* n (sub1 (* 3 n))) 2))

(define (hexagonal-number n)
  (* n (sub1 (* 2 n))))

(define (find-iter i3 i5 i6)
  (cond [(< (pentagonal-number i5) (triangle-number i3))
         (find-iter i3 (add1 i5) i6)]
        [(< (hexagonal-number i6) (triangle-number i3))
         (find-iter i3 i5 (add1 i6))]
        [(= (triangle-number i3) (pentagonal-number i5) (hexagonal-number i6))
         (triangle-number i3)]
        [else (find-iter (add1 i3) i5 i6)]))

(define (prob45)
  (find-iter 286 165 143))