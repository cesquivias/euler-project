(ns math)

(def primes)

(def prime? (memoize (fn [n]
                       (cond (< n 2) false
                             :else
                             (loop [limit (Math/ceil (Math/sqrt n))
                                    pseq primes]
                               (cond (> (first pseq) limit) true
                                     (= (mod n (first pseq)) 0) false
                                     :else (recur limit (rest pseq))))))))
          
(def primes
  (letfn [(next-prime [n]
            (if (prime? n)
              (lazy-seq (cons n (next-prime (+ n 2))))
              (next-prime (+ n 2))))]
    (concat (list 2 3 5) (lazy-seq (next-prime 7)))))
