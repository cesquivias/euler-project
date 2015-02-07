(ns prob45)

(defn make-cache [f]
  (reduce conj #{} (take 100000 (f))))

(defn triangle-numbers
  ([] (triangle-numbers 1))
  ([n] (cons (quot (* n (inc n))
                   2)
             (lazy-seq (triangle-numbers (inc n))))))

(defn pentagonal-numbers
  ([] (pentagonal-numbers 1))
  ([n] (cons (quot (* n (dec (* 3 n)))
                   2)
             (lazy-seq (pentagonal-numbers (inc n))))))

(def p-cache (make-cache pentagonal-numbers))

(defn hexagonal-numbers
  ([] (hexagonal-numbers 1))
  ([n] (cons (* n (dec (* 2 n)))
             (lazy-seq (hexagonal-numbers (inc n))))))

(def h-cache (make-cache hexagonal-numbers))

(defn prob45 []
  (nth (for [n (triangle-numbers)
             :when (and (contains? p-cache n)
                        (contains? h-cache n))]
         n)
       2))
