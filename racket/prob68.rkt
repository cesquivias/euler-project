#lang racket
(first
 (sort (for*/list ([i (range 1 5)]
                   [j (range (+ i 1) 7)]
                   [k (range (+ i 1) 7)]
                   #:unless (= j k)
                   [x (range 1 7)]
                   #:unless (or (= x i) (= x j) (= x k))
                   [y (range 1 7)]
                   #:unless (or (= y i) (= y j) (= y k))
                   [z (range 1 7)]
                   #:unless (or (= z i) (= z j) (= z k))
                   #:when (= (+ i x y) (+ j y z) (+ k z x)))
         (string-join (map number->string (list i x y j y z k z x))
                      ""))
       string>?))

(first
 (sort (for*/list ([i (range 6 11)]
                   [j (range (+ i 1) 11)]
                   [k (remove j (range (+ i 1) 11))]
                   [l (remove* (list j k) (range (+ i 1) 11))]
                   [m (remove* (list j k l) (range (+ i 1) 11))]
                   [x (remove* (list i j k l m) (range 1 11))]
                   [y (remove* (list i j k l m x) (range 1 11))]
                   [z (remove* (list i j k l m x y) (range 1 11))]
                   [w (remove* (list i j k l m x y z) (range 1 11))]
                   [v (remove* (list i j k l m x y z w) (range 1 11))]
                   #:when (= (+ i x y) (+ j y z) (+ k z w) (+ l w v) (+ m v x)))
         (string-join (map number->string (list i x y j y z k z w l w v m v x))
                      ""))
       string>?))
