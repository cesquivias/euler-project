(ns prob42
  (:require [clojure.string :refer [split]]))

(defn ->num-value [word]
  (apply + (map #(- (int %) 64) word)))

(defn triangle-numbers
  ([] (triangle-numbers 1))
  ([n] (cons (quot (* n (inc n))
                   2)
             (lazy-seq (triangle-numbers (inc n))))))

(def triangle-num-cache
  (reduce conj #{} (take 1000 (triangle-numbers))))

(def words
  (-> "res/p042_words.txt"
    slurp
    (.replaceAll "\"" "")
    (split #",")))

(defn prob42 []
  (->> words
    (map ->num-value)
    (filter #(contains? triangle-num-cache %))
    count))
