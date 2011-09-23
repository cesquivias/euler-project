#lang racket

(require racket/set)

(define (prob29 a b)
  (set-count
   (for*/fold 
       ([nums (set)])
     ([a (in-range 2 (add1 a))]
      [b (in-range 2 (add1 b))])
     (values (set-add nums (expt a b))))))
