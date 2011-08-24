(ns prob10
  (:use math))

(defn prob10 [limit]
  (reduce + (take-while #(< % limit) primes)))
