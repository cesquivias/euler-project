(ns prob36)

(defn palindrome? [s]
  (= (vec s) (reverse s)))

(defn prob36 [limit]
  (reduce +
          (for [i (range limit)
                :when (palindrome? (str i))
                :when (palindrome? (Integer/toString i 2))]
            i)))
