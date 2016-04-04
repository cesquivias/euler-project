#lang racket

(require racket/file)
(require racket/set)

(define words 
  (map (λ (s) (substring s 1 (sub1 (string-length s)))) (string-split (file->string "prob42.txt") ",")))

(define word-scores (map (λ (w) (for/sum ([c w])
                                  (- (char->integer c) 64)))
                         words))

(define (triangle n)
  (quotient (* n (add1 n)) 2))

(define triangle-numbers (for/set ((i (in-range 1 200)))
                                  (triangle i)))

(define (prob42)
  (for/sum ([score word-scores])
    (if (set-member? triangle-numbers score)
        1
        0)))
