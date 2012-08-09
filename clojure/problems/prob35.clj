(ns prob35
  (:use [math]))

(defn circular-prime? [num]
  (let [length (count (str num))]
    (every? prime?
            (cons num
                  (for [shift (range 1 length)
                        :let [offset (Math/pow 10 shift)
                              newnum (+ (* (mod num offset)
                                           (Math/pow 10 (- length shift)))
                                        (quot num offset))]]
                    newnum)))))

(defn prob35 [limit]
  (count
   (filter circular-prime? (take-while #(< % limit) primes))))
