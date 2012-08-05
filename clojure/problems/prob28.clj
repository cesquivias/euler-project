(ns prob28)

(defn corner-numbers [s]
  (let [start (* s s)
        diff (dec s)]
    (map #(- start (* diff %)) (range 4))))

(defn prob28 [max-s]
  (inc (reduce + (mapcat #(corner-numbers %) (range 3 (+ max-s 2) 2)))))
