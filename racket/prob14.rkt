#lang racket

(define cache (make-hash '((1 . 1))))

(define (total-steps-iter n start steps)
  (cond
    [(hash-ref cache n #f) (begin
                             (let [(s (+ steps (hash-ref cache n)))]
                               (hash-set! cache start s)
                               s))]
    [(= n 1) (begin
               (hash-set! cache start steps))]
    [(even? n) (total-steps-iter (quotient n 2) start (add1 steps))]
    [else (total-steps-iter (add1 (* 3 n)) start (add1 steps))]))

(define (prob14 limit)
  (let loop [(n 2)
             (max-n 1)
             (max-steps 1)]
    (if (= n limit)
        (cons max-n max-steps)
        (let [(steps (total-steps-iter n n 0))]
          (if (> steps max-steps)
              (loop (add1 n) n steps)
              (loop (add1 n) max-n max-steps))))))
  
