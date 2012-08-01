#!/usr/bin/env python

cache = {}

def total_steps(start):
    if start in cache:
        return cache[start]

    steps = 1
    n = start
    while n != 1:
        steps += 1
        if n % 2 == 0:
            n /= 2
        else:
            n = 3*n + 1
    cache[start] = steps
    return steps
    


def prob14(limit):
    max_n = 1
    max_steps = 1

    for i in xrange(1, limit):
        if total_steps(i) > max_steps:
            max_n = i
            max_steps = total_steps(i)
    return max_n, max_steps

if __name__ == '__main__':
    import sys

    print prob14(int(sys.argv[1]))
