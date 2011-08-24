(ns prob9)

(defn prob9 [sum]
  (reduce *
          (first (filter #(= (+ (* (first %) (first %))
                                (* (second %) (second %)))
                             (* (nth % 2) (nth % 2)))
                         (for [c (range 3 (dec sum))
                               b (range 2 c)]
                           [(- sum c b) b c])))))
