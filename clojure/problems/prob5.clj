(ns prob5)

(defn gcd [a b]
  (if (= b 0)
    a
    (recur b (mod a b))))

(defn lcm [a b]
  (/ (* a b) (gcd a b)))

(defn prob5 [limit]
  (reduce lcm (range 2 (inc limit))))
