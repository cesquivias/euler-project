(ns prob26)

(defn repeating-length [den]
  (loop [i 1
         num 10
         cache {}]
    (cond (= num 0) 0
          (contains? cache num) (- i (cache num))
          :else (recur (inc i) (* 10 (mod num den)) (assoc cache num i)))))

(defn prob26 [max-den]
  (apply max-key second
         (pmap #(vector % (repeating-length %)) (range 2 max-den))))
