#lang racket

(define (prob5 limit)
  (apply lcm (stream->list (in-range 1 (add1 limit)))))
