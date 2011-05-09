#lang racket

(define chain-length
  (let ([memo (make-hash)])
    (define (memo-set! n len)
      (hash-set! memo n len)
      len)
    (λ (orig-n)
      (let loop ([n orig-n]
                 [l 0])
        (cond ((= n 1) (add1 (memo-set! orig-n l)))
              ((hash-has-key? memo n) (add1 (memo-set! orig-n (+ l (hash-ref memo n)))))
              ((even? n) (loop (/ n 2) (add1 l)))
              (else (loop (add1 (* n 3)) (add1 l))))))))

(define (prob14 limit)
  (for/fold ([max-i 0]
             [max-length 0])
    ((i (in-range 1 limit)))
    (let ([new-length (chain-length i)])
      (if (> new-length max-length)
          (values i new-length)
          (values max-i max-length)))))