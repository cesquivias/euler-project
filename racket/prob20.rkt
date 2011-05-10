#lang racket

(define (! n)
  (let loop ([n n]
             [prod 1])
    (if (= n 0)
        prod
        (loop (sub1 n) (* prod n)))))

(define (prob20 limit)
  (foldl + 0 (map (compose string->number string) (string->list (number->string (! limit))))))
