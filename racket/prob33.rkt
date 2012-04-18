#lang racket

(define (prob33)
  (denominator
   (foldl * 1
          (for*/list ([num (in-range 11 100)]
                      [den (in-range (add1 num) 100)]
                      #:unless (or (= 0 (modulo num 10))
                                   (= 0 (modulo den 10))
                                   (= 0 (quotient num 10))
                                   (= 0 (quotient den 10))))
            (define-values (n1 n2) (quotient/remainder num 10))
            (define-values (d1 d2) (quotient/remainder den 10))
            (define nums (list n1 n2))
            (define dens (list d1 d2))
            (if (for*/or ([n nums]
                          [d dens]
                          #:when (= (first (remove n nums))
                                    (first (remove d dens))))
                  (and (not (= n1 n2))
                       (not (= d1 d2))
                       (= (/ num den) (/ n d))))
                (/ num den)
                1)))))
