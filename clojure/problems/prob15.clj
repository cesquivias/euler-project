(ns prob15)

(def routes
  (memoize (fn [X Y]
             (cond (= X 0) 1
                   (= Y 0) 1
                   :else (+ (routes (dec X) Y)
                            (routes X (dec Y)))))))

(defn prob15 []
  (routes 20 20))
