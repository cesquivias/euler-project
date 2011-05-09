#lang racket

(define (prob16 exponent)
  (foldl + 0 (map (compose string->number string)
                  (string->list (number->string (expt 2 exponent))))))