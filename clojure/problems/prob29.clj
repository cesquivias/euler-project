(ns prob29)

(defn prob29 [max-a max-b]
  (count
   (set
    (for [a (range 2 (inc max-a))
          b (range 2 (inc max-b))]
      (reduce * (repeat b a))))))
