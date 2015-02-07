(ns prob46
  (:require [math :refer [primes prime?]]))

(defn square [x] (* x x))

(def squares (atom {:nums '(2)
                    :i 1}))

(defn square? [n]
  (while (> n (first (:nums @squares)))
    (swap! squares (fn [m] {:nums (cons (* 2 (square (:i m)))
                                        (:nums m))
                            :i (inc (:i m))})))
  (loop [nums (:nums @squares)]
    (cond
      (= n (first nums)) true
      (> n (first nums)) false
      :else (recur (rest nums)))))

(defn conjecture-holds? [n]
  (loop [primes primes]
    (let [p (first primes)]
      (cond
        (>= p n) false
        (square? (- n p)) true
        :else (recur (rest primes))))))

(defn odds
  ([] (odds 9))
  ([n]
   (cons n (lazy-seq (odds (+ 2 n))))))

(defn prob46 []
  (loop [compound-odds (remove prime? (odds))]
    (if (conjecture-holds? (first compound-odds))
      (recur (rest compound-odds))
      (first compound-odds))))
