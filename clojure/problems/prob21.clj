(ns prob21
  (:use [clojure.set]))

(def factors
  (memoize
   (fn [number]
     (reduce union #{1}
             (for [i (range 2 (Math/round (Math/sqrt number)))]
               (if (= (mod number i) 0)
                 (union (factors (quot number i)) #{i (quot number i)})
                 #{}))))))

(defn amicable? [num]
  (let [other (reduce + (factors num))]
    (and (not= other num) (= num (reduce + (factors other))))))

(defn prob21 [limit]
  (reduce + (filter amicable? (range 1 limit))))
