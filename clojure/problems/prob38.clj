(ns prob38)

(defn pandigital? [digits]
  (let [unique-digits (set digits)]
    (and (= (count digits) 9)
         (= (count unique-digits) 9)
         (not (contains? unique-digits \0)))))

(defn concatenated-product [n]
  (loop [i 1
         digits ""]
    (if (> (count digits) 8)
      digits
      (recur (inc i) (str digits (* i n))))))

(defn prob38 []
  (reduce max
          (for [n (range 500000)
                :let [prod (concatenated-product n)]
                :when (pandigital? prod)]
            (Long/parseLong prod))))
