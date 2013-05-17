#lang racket

(require racket/generator)

(define (pentagonal-number n)
  (quotient (* n (sub1 (* 3 n))) 2))

(define (pentagonal-numbers size)
  (define numbers (make-vector size))
  (for ([i size])
    (vector-set! numbers i (pentagonal-number (add1 i))))
  numbers)

(define (prob44 size)
  (define numbers (pentagonal-numbers size))
  (define number-set (for/set ([n numbers]) n))
  (for*/fold ([min-diff 10000000])
      ([j (in-range 1 size)]
       [i (in-range 0 j)]
       #:when (and (set-member? number-set
                                (+ (vector-ref numbers j)
                                   (vector-ref numbers i)))
                   (set-member? number-set
                                (- (vector-ref numbers j)
                                   (vector-ref numbers i)))))
    (min min-diff (- (vector-ref numbers j)
                     (vector-ref numbers i)))))
