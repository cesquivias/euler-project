(ns prob17)

(def teens {1 "one"
            2 "two"
            3 "three"
            4 "four"
            5 "five"
            6 "six"
            7 "seven"
            8 "eight"
            9 "nine"
            10 "ten"
            11 "eleven"
            12 "twelve"
            13 "thirteen"
            14 "fourteen"
            15 "fifteen"
            16 "sixteen"
            17 "seventeen"
            18 "eighteen"
            19 "nineteen"})

(def tens {1 "ten"
           2 "twenty"
           3 "thirty"
           4 "forty"
           5 "fifty"
           6 "sixty"
           7 "seventy"
           8 "eighty"
           9 "ninety"})

(def hundreds {1 "onehundred"
               2 "twohundred"
               3 "threehundred"
               4 "fourhundred"
               5 "fivehundred"
               6 "sixhundred"
               7 "sevenhundred"
               8 "eighthundred"
               9 "ninehundred"})

(defn num-words [n]
  (cond (< n 20) (teens n)
        (< n 100) (let [[ten one] (map #(Character/digit % 10) (str n))]
                    (str (tens ten) (teens one)))
        (< n 1000) (let [digits (str n)
                         word (hundreds (Character/digit (first digits) 10))]
                     (if (= (rest digits) '(\0 \0))
                       word
                       (str word "and" (num-words (Integer/parseInt
                                                   (apply str (rest digits))
                                                   10)))))
        :else "onethousand"))

(defn prob17 [limit]
  (reduce + (map (comp count num-words) (range 1 (inc limit)))))
