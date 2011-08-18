(ns prob6)

(defn prob6 [limit]
  (- (#(* % %) (reduce + (range (inc limit))))
     (reduce + (map #(Math/pow % 2) (range (inc limit))))))
