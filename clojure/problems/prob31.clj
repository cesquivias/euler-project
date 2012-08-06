(ns prob31)

(defn prob31 [amt]
  (let [end (inc amt)]
    (reduce + 
            (for [c200 (range 0 end 200)
                  c100 (range 0 (- end c200) 100)
                  c50 (range 0 (- end c200 c100) 50)
                  c20 (range 0 (- end c200 c100 c50) 20)
                  c10 (range 0 (- end c200 c100 c50 c20) 10)
                  c5 (range 0 (- end c200 c100 c50 c20 c10) 5)
                  c2 (range 0 (- end c200 c100 c50 c20 c10 c5) 2)
                  c1 (range 0 (- end c200 c100 c50 c20 c10 c5 c2) 1)
                  :when (= amt (+ c200 c100 c50 c20 c10 c5 c2 c1))]
              1))))
