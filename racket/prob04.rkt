#lang racket

(define (is-palindrome? str)
  (equal? str (list->string (reverse (string->list str)))))
  

(define (prob4 limit)
  (foldl max 0 
         (map string->number
              (filter is-palindrome? (for*/list ([i (in-range limit)]
                                                 [j (in-range limit)])
                                       (number->string (* i j)))))))