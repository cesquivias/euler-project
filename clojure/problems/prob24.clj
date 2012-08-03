(ns prob24)

(defn ! [n]
  (reduce * (range 1 (inc n))))

(defn permutation
  ([n]
     (permutation n n))
  ([n r]
     (quot (! n) (! (- n r)))))

(defn nth-digit [n remaining-digits ordered-digits]
  (if (= (count remaining-digits) 1)
    (conj ordered-digits (first remaining-digits))
    (let [base (dec (count remaining-digits))
          mult (last (take-while #(< (* % (! base)) n) (range 1 (inc base))))
          next-num (nth remaining-digits mult)]
      (nth-digit (- n (* mult (! base)))
                 (concat (take mult remaining-digits)
                         (drop (inc mult) remaining-digits))
                 (conj ordered-digits next-num)))))

(defn prob24 [n num-digits]
  (Long/parseLong (apply str (nth-digit n (range num-digits) []))))
