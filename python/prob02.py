#/usr/bin/env python

def fib_sum(limit):
    n1 = 1
    n2 = 1
    s = 0

    while n2 < limit:
        if n2 % 2 == 0:
            s += n2
        n1, n2 = n2, n1 + n2

    return s


if __name__ == '__main__':
    print fib_sum(4000000)
