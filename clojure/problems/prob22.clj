(ns prob22)

(def names (sort (map #(.substring % 1 (dec (count %)))
                      (.split (slurp "res/names.txt") ","))))

(defn char-score [c]
  (- (int c) 64))

(defn prob22 []
  (reduce + (for [[i name] (map-indexed vector names)]
              (* (inc i)
                 (reduce + (map char-score name))))))
