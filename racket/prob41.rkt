#lang racket

(require "primes.rkt")
(require racket/generator)

(define (reversals l)
  (generator ()
             (if (= (length l) 1)
                 (for ([el l])
                   (yield (list el)))
                 (for* ([d l]
                        [rev (in-producer (reversals (remove d l)) (void))])
                   (define new-list (cons d rev))
                   (yield new-list)))))

(define (digits->number digits)
  (for/sum ([i (in-range (length digits))]
            [v (reverse digits)])
    (* v (expt 10 i))))

(define (prob41)
  (digits->number
   (for/first ([i (in-producer (reversals '(7 6 5 4 3 2 1)) (void))]
               #:when (prime? (digits->number i)))
     i)))
