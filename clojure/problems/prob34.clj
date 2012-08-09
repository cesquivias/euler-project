(ns prob34)

(def !
  (memoize (fn [n] (reduce * (range 1 (inc n))))))

(defn sum-of-factorial-digits? [n]
  (= n
     (reduce + (map #(! (Character/digit % 10)) (str n)))))

(defn prob34 [limit]
  (reduce + (filter sum-of-factorial-digits? (range 3 limit))))
