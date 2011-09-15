#lang racket

(require "primes.rkt")

(define (prime-list a b)
  (let loop ([p-list '()]
             [x 0])
    (let ([y (+ (* x x) (* a x) b)])
    (if (prime? y)
        (loop (cons y p-list) (add1 x))
        p-list))))

(define (prob27 a-limit b-limit)
  (for*/fold ([A 0]
              [B 0]
              [prime-length 0])
             ([a (in-range (- a-limit) a-limit)]
              [b (in-range (- b-limit) b-limit)])
    (let ([len (length (prime-list a b))])
      (if (> len prime-length)
          (values a b len)
          (values A B prime-length)))))
