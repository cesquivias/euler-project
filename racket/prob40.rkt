#lang racket

(require racket/generator)

(define (champ-constant)
  (generator ()
             (let loop ([i 1]
                        [base 10]
                        [power 1])
               (if (< i base)
                   (begin
                     (for ([j (in-range power 0 -1)])
                       (yield (quotient (remainder i (expt 10 j))
                                        (expt 10 (sub1 j)))))
                     (loop (add1 i) base power))
                   (loop i (* base 10) (add1 power))))))

(define (prob40)
  (let loop ([ns '(1 10 100 1000 10000 100000 1000000)]
             [prod 1]
             [i 1]
             [g (champ-constant)])
    (define num (g))
    (if (empty? ns)
        prod
        (if (= i (first ns))
            (begin
              (displayln num)
              (loop (rest ns) (* prod num) (add1 i) g))
            (loop ns prod (add1 i) g)))))
