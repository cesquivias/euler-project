(ns prob1)

(defn prob1 [limit]
  (reduce + (filter #(or (= (mod % 3) 0) (= (mod % 5) 0)) (range limit))))
