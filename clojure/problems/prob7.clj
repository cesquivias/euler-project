(ns prob7
  (:use [math]))

(defn prob7 [n]
  (loop [i 0
         p primes]
    (if (= i n)
      (first p)
      (recur (inc i) (rest p)))))
