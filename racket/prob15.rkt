#lang racket

(define make-coord cons)
(define num-rows car)
(define num-cols cdr)

(define get-total-paths
  (let ([memo (make-hash)])
    (λ (coord)
      (cond ((and (= (num-rows coord) 0) (= (num-cols coord) 0)) 0)
            ((or (= (num-rows coord) 0) (= (num-cols coord) 0)) 1)
            ((hash-has-key? memo coord) (hash-ref memo coord))
            (else (let ([paths (+ (get-total-paths (make-coord (sub1 (num-rows coord)) (num-cols coord)))
                                  (get-total-paths (make-coord (num-rows coord) (sub1 (num-cols coord)))))])
                    (hash-set! memo coord paths)
                    paths))))))

(define (prob15 rows cols)
  (get-total-paths (make-coord rows cols)))