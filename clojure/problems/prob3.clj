(ns prob3
  (:use [math]))

(defn prob3 [number]
  (loop [factors []
         n number]
    (if (= n 1)
      (apply max factors)
      (let [factor (first (drop-while #(not= 0 (mod n %)) primes))]
        (recur (conj factors factor) (quot n factor))))))
