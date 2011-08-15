(ns prob3)

(def primes)

(defn prime? [n]
  (loop [limit (Math/ceil (Math/sqrt n))
         pseq primes]
    (cond (> (first pseq) limit) true
          (= (mod n (first pseq)) 0) false
          :else (recur limit (rest pseq)))))
          
(def primes
  (letfn [(next-prime [n]
            (if (prime? n)
              (lazy-seq (cons n (next-prime (+ n 2))))
              (next-prime (+ n 2))))]
    (concat (list 2 3 5) (lazy-seq (next-prime 7)))))

(defn prob3 [number]
  (loop [factors []
         n number]
    (if (= n 1)
      (apply max factors)
      (let [factor (first (drop-while #(not= 0 (mod n %)) primes))]
        (recur (conj factors factor) (quot n factor))))))
