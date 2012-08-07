(ns prob33)

(defn trivial-reduction? [num den]
  (or (= num den)
      (and (= (mod num 10) 0)
           (= (mod den 10) 0))))

(defn naive-reduce [num den]
  (let [n1 (mod num 10)
        n10 (quot num 10)
        d1 (mod den 10)
        d10 (quot den 10)
        safe-div (fn [n d]
                   (if (= d 0)
                     0
                     (/ n d)))]
    (cond (= n1 d1) (safe-div n10 n10)
          (= n1 d10) (safe-div n10 d1)
          (= n10 d1) (safe-div n1 d10)
          (= n10 d10) (safe-div n1 d1)
          :else 0)))

(defn prob33 []
  (denominator
   (reduce *
           (for [den (range 10 100)
                 num (range 10 den)
                 :when (not (trivial-reduction? num den))
                 :when (= (/ num den) (naive-reduce num den))]
             (/ num den)))))
