(ns prob37
  (:use [math]))

(def left-truncatable?
  (memoize
   (fn [n pow]
     (if (= n 0)
       true
       (and (prime? n) (left-truncatable? (mod n pow) (quot pow 10)))))))

(def right-truncatable?
  (memoize
   (fn [n]
     (if (= n 0)
       true
       (and (prime? n) (right-truncatable? (quot n 10)))))))

(defn truncatable? [n]
  (and (left-truncatable? n (reduce * (repeat (count (str n)) 10)))
       (right-truncatable? n)))

(defn prob37 [total]
  (loop [truncatable-primes []
         primes (drop-while #(< % 10) primes)]
    (cond (= (count truncatable-primes) total) (reduce + truncatable-primes)
          (truncatable? (first primes)) (recur (conj truncatable-primes
                                                    (first primes))
                                              (rest primes))
          :else (recur truncatable-primes (rest primes)))))
