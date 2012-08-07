(ns prob19
  (:import [java.util Calendar GregorianCalendar]))

(defn prob19 []
  (reduce +
          (for [year (range 1901 2001)
                month (range 12)]
            (let [cal (GregorianCalendar. year month 1)]
              (if (= (.get cal Calendar/DAY_OF_WEEK) Calendar/SUNDAY)
                1
                0)))))

