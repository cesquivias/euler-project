(ns prob12
  (:use math))

(def triangle-numbers (letfn ((ntri [s n]
                                (lazy-seq (cons s (ntri (+ s n) (inc n))))))
                        (ntri 1 2)))

(defn prime-factors [num]
  (loop [factors []
         n num]
    (if (= n 1)
      factors
      (let [factor (first (drop-while #(not= (mod n %) 0) primes))]
        (recur (conj factors factor) (quot n factor))))))

(defn num-factors [pfactors]
  (loop [factors pfactors
         factor-count {}]
    (if-let [factor (first factors)]
      (recur (rest factors)
             (assoc factor-count factor (inc (factor-count factor 0))))
      (reduce * (map inc (vals factor-count))))))

(defn prob12 [min-factors]
  (first (filter #(> (num-factors (prime-factors %)) min-factors)
                 triangle-numbers)))
