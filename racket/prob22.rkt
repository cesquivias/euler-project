#lang racket

(define (name-value name)
  (let loop ([sum 0]
             [letters (string->list name)])
    (if (null? letters)
        sum
        (loop (+ sum (- (char->integer (car letters)) 64)) (cdr letters)))))

(define (prob22)
  (define names (sort (map (λ [s] (substring s 1 (sub1 (string-length s))))
                           (regexp-split #rx"," (file->string "prob22.txt")))
                      string<?))
  (let loop ([i 1]
             [sum 0]
             [names names])
    (if (null? names)
        sum
        (loop (add1 i) (+ sum (* i (name-value (car names)))) (cdr names)))))
