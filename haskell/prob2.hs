prob2 limit = prob2_iter 1 1 0 limit

prob2_iter a b total limit =
    if a > limit then
       total
    else
        prob2_iter b (a+b) (if even a then (total+a) else total) limit

main = do
     print (prob2 4000000)
