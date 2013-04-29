#lang racket

(define (sum-of-squares numbers)
  (foldl + 0 (map (λ [x] (* x x)) numbers)))

(define (square-of-sum numbers)
  (let ([sum (foldl + 0 numbers)])
    (* sum sum)))

(define (prob6 limit)
  (let ([numbers (stream->list (in-range 1 (add1 limit)))])
    (- (square-of-sum numbers)
       (sum-of-squares numbers))))
