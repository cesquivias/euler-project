prob1 limit = sum [ i | i <- [1..limit-1], i `mod` 3 == 0 || i `mod` 5 == 0 ]

main = do
     print (prob1 1000)
