import std.stdio;

void main() {
    writefln("%d", fibSum(4000000));
}

long fibSum(long limit) {
    long fib0 = 1;
    long fib1 = 2;
    long tmp;

    long sum = 0;
    while (fib1 < limit) {
        if ((fib1 % 2) == 0) {
            sum += fib1;
        }
        tmp = fib0 + fib1;
        fib0 = fib1;
        fib1 = tmp;
    }

    return sum;
}
