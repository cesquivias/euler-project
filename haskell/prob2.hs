fib = 1 : 1 : [ a+b | (a,b) <- zip fib (tail fib) ]

main = do
     print (sum (takeWhile (< 4000000) [ i | i <- fib, even i ]))
