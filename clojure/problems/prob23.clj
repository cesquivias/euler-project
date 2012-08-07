(ns prob23
  (:use [prob21 :only [factors]]))

(defn abundant? [num]
  (> (reduce + (factors num)) num))

(def abundant-numbers (set (filter abundant? (range 12 28123))))

(defn sum-of-two-abundant? [num]
  (first
   (for [i abundant-numbers
         :when (contains? abundant-numbers (- num i))]
     true)))

(defn prob23 []
  (reduce + (filter (complement sum-of-two-abundant?) (range 28123))))
