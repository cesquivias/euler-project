(ns prob16)

(defn prob16 [exp]
  (reduce + (map #(Character/digit % 10) (str (reduce * (repeat exp 2))))))
