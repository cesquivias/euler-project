#lang racket

(require "nums.rkt")
(require "primes.rkt")

(define (perms? p1 p2 p3)
  (define digits (map (λ (p) (sort (number->digits p) >))
                        (list p1 p2 p3)))
  (and (equal? (first digits) (second digits))
       (equal? (first digits) (third digits))))

(define (constant-diff-perm-primes? p1 p2)
  (define p3 (+ p2 (- p2 p1)))
  (if (and (prime? p3) (perms? p1 p2 p3))
      (list p1 p2 p3)
      #f))

(define (prime-perm ps)
  (define p1 (first ps))
  (for/first ([p2 (rest ps)]
              #:when (constant-diff-perm-primes? p1 p2))
   (constant-diff-perm-primes? p1 p2)))

(define (prob49b)
  (define ps (for/list ([p primes]
                        #:unless (< p 1000)
                        #:break (> p 10000))
               p))
  (let loop ([prime-perms '()]
             [ps ps])
    (if (empty? ps)
        prime-perms
        (let ([pp (prime-perm ps)])
          (cond
            [pp (loop (cons (apply string-append (map number->string pp)) 
                            prime-perms)
                      (rest ps))]
            [else (loop prime-perms (rest ps))])))))