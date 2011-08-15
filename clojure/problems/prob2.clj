(ns prob2)

(def fibonacci
  (letfn [(fib [a b]
            (lazy-seq (cons b (fib b (+ a b)))))]
    (fib 1 1)))

(defn prob2 [limit]
  (reduce + (filter even? (take-while #(< % limit) fibonacci))))
