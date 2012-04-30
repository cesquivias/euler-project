#lang racket

(define (is-palindrome? str)
  (equal? str (list->string (reverse (string->list str)))))

(define (prob36 limit)
  (for/sum ((i (in-range limit))
            #:when (is-palindrome? (number->string i))
            #:when (is-palindrome? (format "~b" i)))
           i))
