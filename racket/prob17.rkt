#lang racket

(define (number->uniques i)
  (case i
    [[1] "one"]
    [[2] "two"]
    [[3] "three"]
    [[4] "four"]
    [[5] "five"]
    [[6] "six"]
    [[7] "seven"]
    [[8] "eight"]
    [[9] "nine"]
    [[10] "ten"]
    [[11] "eleven"]
    [[12] "twelve"]
    [[13] "thirteen"]
    [[14] "fourteen"]
    [[15] "fifteen"]
    [[16] "sixteen"]
    [[17] "seventeen"]
    [[18] "eighteen"]
    [[19] "nineteen"]
    [else ""]))

(define (number->tens i)
  (case i
    [[2] "twenty"]
    [[3] "thirty"]
    [[4] "forty"]
    [[5] "fifty"]
    [[6] "sixty"]
    [[7] "seventy"]
    [[8] "eighty"]
    [[9] "ninety"]))

(define (number->english i)
  (cond [(< i 20) (number->uniques i)]
        [(< i 100) (string-append 
                    (number->tens (quotient i 10))
                    (number->english (remainder i 10)))]
        [(= i 1000) "onethousand"]
        [else (string-append
               (number->uniques (quotient (remainder i 1000) 100))
               "hundred"
               (if (= (modulo i 100) 0)
                   ""
                   (string-append
                    "and"
                    (number->english (remainder i 100)))))]))

(define (total-letters i)
  (string-length (number->english i)))

(define (prob17 limit)
  (for/fold ([sum 0])
    ([i (in-range 1 (add1 limit))])
    (values (+ sum (total-letters i)))))
