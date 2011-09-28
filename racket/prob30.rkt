#lang racket

(define (sum-pow-digits n pow)
  (foldl +
         0
         (map (lambda (c) (expt (string->number (string c)) pow))
              (string->list (number->string n)))))

(define (prob30 pow)
  (for/fold ([sum 0])
            ([i (in-range 2 1000000)])
     (if (= i (sum-pow-digits i pow))
         (values (+ i sum))
         (values sum))))
