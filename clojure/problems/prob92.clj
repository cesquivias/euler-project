(ns prob92)

(defn next-num [^long n]
  (loop [n n
         sum 0]
    (if (= n 0)
      sum
      (recur (quot n 10)
             (+ sum (#(* % %) (mod n 10)))))))

(defn arrives-89? [^long n]
  (loop [n (long n)]
    (cond
      (= n 1) false
      (= n 89) true
      :else (recur (next-num n)))))

(defn prob92 []
  (loop [n (long 1)
         total (long 0)]
    (cond
      (= n (long 10000000)) total
      (arrives-89? n) (recur (inc n) (inc total))
      :else (recur (inc n) total))))
