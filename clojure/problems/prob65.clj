(ns prob65)

(defn prefixes
  ([] (prefixes 2))
  ([n] (lazy-cat [1 n 1]
                 (prefixes (+ n 2)))))

;;(defn prefixes [] (repeat 2))
(def start 2)

(defn partial-fraction
  ([i] (+ start (partial-fraction i (prefixes))))
  ([i pre]
  (cond
    (= i 0) (/ 1 (first pre))
    :else (/ 1
             (+ (first pre)
                (partial-fraction (dec i) (rest pre)))))))

