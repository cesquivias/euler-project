#lang racket

(require racket/file)

(define grid-path "prob11.txt")
(define prod-length 4)

(define (read-grid path)
  (define str (file->string path))
  (for/list ([line (regexp-split #rx"\n" str)])
    (map string->number (regexp-split #rx" " line))))

(define (grid-rows grid)
  (length grid))

(define (grid-columns grid)
  (length (first grid)))

(define (grid-ref grid row col)
  (list-ref (list-ref grid row) col))

(define (row-product grid row col)
  (foldl * 1
         (for/list ([j (in-range col (+ col prod-length))])
           (grid-ref grid row j))))

(define (col-product grid row col)
  (foldl * 1
         (for/list ([i (in-range row (+ row prod-length))])
           (grid-ref grid i col))))

(define (diag-product grid row col)
  (foldl * 1
         (for/list ([i (in-range row (+ row prod-length))]
                    [j (in-range col (+ col prod-length))])
           (grid-ref grid i j))))

(define (reverse-diag-product grid row col)
  (foldl * 1
         (for/list ([i (in-range row (- row prod-length) -1)]
                    [j (in-range col (+ col prod-length))])
           (grid-ref grid i j))))

(define (max-reverse-diag grid)
  (apply max 
         (for*/list ([i (in-range (sub1 prod-length)
                                  (- (grid-rows grid) prod-length))]
                     [j (in-range (- (grid-columns grid)
                                     prod-length))])
           (reverse-diag-product grid i j))))

(define (prob11)
  (define grid (read-grid grid-path))
  (apply
   max
   (cons
    (max-reverse-diag grid)
    (for*/list ([i (in-range (- (grid-rows grid) prod-length))]
                [j (in-range (- (grid-columns grid) prod-length))])
      (max (row-product grid i j)
           (col-product grid i j)
           (diag-product grid i j))))))
