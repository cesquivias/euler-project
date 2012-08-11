(ns prob39)

(defn prob39 [limit]
  (reduce (fn [[k1 v1 :as p1] [k2 v2 :as p2]]
            (if (> (count v1) (count v2))
              p1
              p2))
          (reduce
           #(assoc %1 %2
                   (for [c (range 5 %2)
                         b (range 2 (inc (quot (- %2 c) 2)))
                         :let [a (- %2 b c)]
                         :when (= (* c c) (+ (* a a) (* b b)))]
                     [a b c]))
           {}
           (range 5 (inc limit)))))
