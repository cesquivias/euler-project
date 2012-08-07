(ns prob34)

(defn palindrome? [s]
  (= (vec s) (reverse s)))

(defn prob34 [limit]
  (reduce +
          (for [i (range limit)
                :when (palindrome? (str i))
                :when (palindrome? (Integer/toString i 2))]
            i)))
