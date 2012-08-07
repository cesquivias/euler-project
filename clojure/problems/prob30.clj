(ns prob30)

(defn prob30 [exp]
  (reduce +
          (for [n0 (range 3)
                n1 (range 10)
                n2 (range 10)
                n3 (range 10)
                n4 (range 10)
                n5 (range 10)
                :let [sum (+ (Math/pow n0 exp)
                             (Math/pow n1 exp)
                             (Math/pow n2 exp)
                             (Math/pow n3 exp)
                             (Math/pow n4 exp)
                             (Math/pow n5 exp))]
                :when (= sum
                         (+ (* n0 100000)
                            (* n1 10000)
                            (* n2 1000)
                            (* n3 100)
                            (* n4 10)
                            n5))
                :when (not= sum 1)]
            sum)))
