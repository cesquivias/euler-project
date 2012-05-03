#lang racket

(require racket/stream)

(provide sum fib ! proper-divisors
         number->digits digits->number)

(define (sum nums)
  (foldl + 0 nums))

(define fib
  (let loop ([a 1]
             [b 2])
    (stream-cons a (loop b (+ a b)))))

(define (! n)
  (let loop ([n n]
             [prod 1])
    (if (= n 0)
        prod
        (loop (sub1 n) (* prod n)))))

(define (proper-divisors num)
  (for/fold ([divisors '(1)])
    ([i (in-range 2 (add1 (quotient num 2)))]
     #:when (= (modulo num i) 0))
    (values (cons i divisors))))

(define (number->digits num)
  (let loop ([dlist '()]
             [n num])
    (if (zero? n)
        dlist
        (loop (cons (modulo n 10) dlist)
              (quotient n 10)))))

(define (digits->number dlist)
  (for/fold ([num 0])
      ([p10 (in-range (sub1 (length dlist)) -1 -1)]
       [digit dlist])
    (+ num (* digit (expt 10 p10)))))

