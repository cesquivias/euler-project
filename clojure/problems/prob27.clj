(ns prob27
  (:use [math :only [prime?]]))

(defn primes-length [a b]
  (count
   (take-while prime?
               (for [n (iterate inc 0)]
                 (+ (* n n) (* a n) b)))))

(defn prob27 []
  ((fn [[l a b]] (* a b))
   (apply max-key first
          (let [b-s (filter prime? (range 3 1000))]
            (for [a (range -999 1000)
                  b (filter prime? (range (min 3 (inc (Math/abs a))) 1000))
                  :when (< a b)]
              [(primes-length a b) a b])))))
