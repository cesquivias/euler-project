#lang racket

(provide stream-nth stream-take)

(define (stream-nth st n)
  (let loop ([i n]
             [s st])
    (if (= i 0)
        (stream-first s)
        (loop (- i 1) (stream-rest s)))))

(define (stream-take st n)
  (reverse
   (let loop ([i n]
              [ls '()]
              [s st])
     (if (= i 0)
         ls
         (loop (sub1 i) (cons (stream-first s) ls)
               (stream-rest s))))))
