#lang racket

(require "nums.rkt")

(define (prob20 limit)
  (foldl + 0 (map (compose string->number string) (string->list (number->string (! limit))))))
