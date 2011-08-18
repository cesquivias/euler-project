(ns prob4)

(defn palindrome? [num]
  (let [s (str num)]
    (= s (apply str (reverse s)))))

(defn prob4 [length]
  (reduce max
   (filter palindrome?
           (let [start (int (Math/pow 10 length))
                 end (int (Math/pow 1 (dec length)))]
             (for [i (range (dec start) end -1)
                   j (range (dec start) end -1)]
               (* i j))))))
