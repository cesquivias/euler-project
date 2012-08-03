(ns prob25
  (:use [prob2 :only [fibonacci]]))

(defn prob25 [l]
  (first
   (for [[i f] (map-indexed vector (cons 1 fibonacci))
         :when (>= (count (str f)) l)]
     (inc i))))
