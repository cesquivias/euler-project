#lang racket

(define (prob13)
  (let* ([data (file->string "prob13.txt")]
         [lines (regexp-split #rx"\n" data)])
    (substring 
     (number->string (foldl + 0 (map string->number lines)))
     0 10)))