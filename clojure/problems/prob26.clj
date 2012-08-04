(ns prob26)

(defn decimals [den]
  (letfn [(next-dec [n]
            (let [num (* n 10)
                  q (quot num den)
                  r (mod num den)]
              (if (= r 0)
                (list q)
                (cons q (lazy-seq (next-dec r))))))]
    (lazy-seq (next-dec 1))))

(def sample-size 3300)
(def offset-tolerance 10)
(def repeat-tolerance 3)

(defn sublist [start end l]
  (take (- end start) (drop start l)))

(defn repeats? [start stop sample]
  (let [l (- stop start)
        test (sublist start stop sample)]
    (loop [n 0]
      (cond (= n repeat-tolerance) true
            (not= test (sublist (+ start (* n l)) (+ stop (* n l)) sample)) false
            :else (recur (inc n))))))

(defn repeating-length [den]
  (let [nums (take sample-size (decimals den))]
    (loop [offset 0
           length 1]
      (cond (= offset offset-tolerance) nil
            (= length den) (recur (inc offset) 1)
            (repeats? offset (+ offset length) nums) length
            :else (recur offset (inc length))))))

(defn prob26 [max-den]
  (reduce (partial max-key second)
          (remove (comp nil? second)
                  (pmap #(vector % (repeating-length %)) (range 2 max-den)))))
