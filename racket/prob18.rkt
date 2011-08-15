#lang racket

(define (read-tree)
  (let* ([str (file->string "prob18.txt")]
         [lines (reverse (regexp-split #rx"\n" str))])
    (map (λ [l] (map string->number (regexp-split #rx" " l))) lines)))

(define (merge-rows row1 row2)
  (let loop ([row1 row1]
             [row2 row2]
             [output '()])
    (if (null? row2)
        (reverse output)
        (loop (rest row1) (rest row2) 
              (cons (+ (first row2) 
                       (max (first row1) (second row1)))
                    output)))))
  

(define (prob18 tree)
  (let loop ([tree tree])
    (if (= (length tree) 1)
        (first tree)
        (loop (cons (merge-rows (first tree) (second tree))
                    (drop tree 2))))))
