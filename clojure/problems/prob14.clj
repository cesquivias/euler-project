(ns prob14
  (:import [java.util HashMap]))

(def cache (HashMap.))
(.put cache 1 1)

(defn total-steps [start]
  (loop [i start
         steps 0]
    (cond (.containsKey cache i) (let [all-steps (+ steps (.get cache i))]
                                   (.put cache start all-steps)
                                   all-steps)
          (even? i) (recur (quot i 2) (inc steps))
          :else (recur (inc (* i 3)) (inc steps)))))

(defn prob14 [limit]
  (reduce #(if (> (total-steps %1) (total-steps %2))
             %1
             %2)
          (range 1 limit)))
