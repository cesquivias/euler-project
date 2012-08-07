(ns prob20)

(defn prob20 [num]
  (reduce + (map #(Character/digit % 10) (str (reduce * (range 1 (inc num)))))))
