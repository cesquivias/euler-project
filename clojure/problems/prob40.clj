(ns prob40)

(defn digits [n]
  (loop [n n
         l '()]
    (if (= n 0)
      l
      (recur (quot n 10)
             (conj l (mod n 10))))))

(defn decimals
  ([] (cons 0 (decimals 1)))
  ([n] (lazy-cat (digits n)
                 (decimals (inc n)))))

(defn prob40 []
  (let [d (decimals)]
    (* (nth d 1)
       (nth d 10)
       (nth d 100)
       (nth d 1000)
       (nth d 10000)
       (nth d 100000)
       (nth d 1000000))))
