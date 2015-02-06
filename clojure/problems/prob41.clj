(ns prob41
  (:require [math :refer [prime? primes]]
            [clojure.math.combinatorics :as combo]))

(defn pandigital? [^long n]
  (loop [n n
         sum 0
         l 0]
    (cond
      (= n 0) (= sum (quot (* l (inc l)) 2))
      :else (recur (quot n 10)
                   (+ sum (mod n 10))
                   (inc l)))))

(defn ->num [digits]
  (loop [digits digits
         n 0
         l 1]
    (if (empty? digits)
      n
      (recur (rest digits)
             (+ n (* l (first digits)))
             (* 10 l)))))

(defn prob41 []
  (->> (range 1 8)
    combo/permutations
    (map ->num)
    (filter prime?)
    sort
    last))
