#lang racket

(require "nums.rkt")

(define (construct-number num-digits counts)
  (let loop ([counts counts]
             [digits '()]
             [digits-left (stream->list (in-range num-digits))])
    (if (empty? counts)
        (append digits digits-left)
        (let* ([i (car counts)]
               [num (list-ref digits-left i)])
          (loop (cdr counts) (append digits (list num)) (remove num digits-left))))))

(define (sum-multiples multiples num-digits)
  (let loop ([sum 0]
             [multiples multiples]
             [d (sub1 num-digits)])
    (if (empty? multiples)
        (add1 sum)
        (loop (+ sum (* (car multiples) (! d))) (cdr multiples) (sub1 d)))))

(define (count-steps target digits)
  (let loop ([multiples '()]
             [i 0]
             [digit digits])
    (cond 
      [(= digit 1) multiples]
      [(> (sum-multiples (append multiples `(,i)) digits) target)
       (loop (append multiples (list (sub1 i))) 0 (sub1 digit))]
      [else (loop multiples (add1 i) digit)])))

(define (prob24 ith total-digits)
  (construct-number total-digits (count-steps ith total-digits)))
