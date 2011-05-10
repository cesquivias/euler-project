#lang racket

(define (leap-year? year)
  (cond [(= (modulo year 400) 0) #t]
        [(= (modulo year 100) 0) #f]
        [(= (modulo year 4) 0) #t]
        [else #f]))

(define (offset-for-year year offset)
  (modulo (+ (modulo (if (leap-year? year) 366 365) 7) offset) 7))

(define (month-sundays-for-year year offset)
  (let loop ([days offset]
             [months `(31 ,(if (leap-year? year) 29 28) 31 30 31 30 31 31 30 31 30 31)]
             [month-sundays 0])
    (if (null? months)
        month-sundays
        (loop (+ days (car months)) (cdr months) (+ month-sundays (if (= (modulo days 7) 6) 1 0))))))

(define (prob19)
  ;; Monday: offset=0
  (let loop ([year 1901]
             [offset 1]
             [month-sundays 0])
    (if (> year 2000)
        month-sundays
        (loop (add1 year) (offset-for-year year offset) (+ month-sundays (month-sundays-for-year year offset))))))
