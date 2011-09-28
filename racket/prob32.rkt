#lang racket

(define (prob32)
  (foldl + 0
         (set->list
          (for*/fold
              ([product-set (set)])
            ([i (in-range 1 10000)]
             [j (in-range 1 1000)])
            (let* ([ans (* i j)]
                   [digits (string-append (number->string i) (number->string j)
                                          (number->string ans))]
                   [digit-set (list->set (string->list digits))])
              (if (and (= 9 (string-length digits))
                       (= 9 (set-count digit-set))
                       (not (set-member? digit-set #\0)))
                  (values (set-add product-set ans))
                  (values product-set)))))))
