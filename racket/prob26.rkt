#lang racket

(require "streams.rkt")

(define (numerator-stream den)
  (let loop ([num 1])
    (if (= num 0)
        '()
        (stream-cons num (loop (remainder (* 10 num) den))))))

(define (position val lst [start 0])
  (let loop ([i start]
             [lst (drop lst start)])
    (cond [(empty? lst) #f]
          [(= val (car lst)) i]
          [else (loop (add1 i) (cdr lst))])))

(define (decimal-cycle den)
  (let loop ([num-stream (numerator-stream den)]
             [nums '()])
    (if (stream-empty? num-stream)
        #f
        (let* ([n (stream-first num-stream)]
               [i (position n nums)])
          (if i
              (let ([j (position n nums (add1 i))])
                (if j
                    (- j i)
                    (loop (stream-rest num-stream) (cons n nums))))
              (loop (stream-rest num-stream) (cons n nums)))))))

(define (prob26 limit)
  (for/fold ([longest-cycle 0]
             [longest-num 1])
            ([i (in-range 2 limit)])
    (let ([cycle (decimal-cycle i)])
      (cond [(not cycle) (values longest-cycle longest-num)]
            [(> cycle longest-cycle) (values cycle i)]
            [else (values longest-cycle longest-num)]))))
