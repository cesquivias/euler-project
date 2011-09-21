import std.stdio;

void main() {
    int ans = multipleSum(1000);
    writefln("%d", ans);
}

int multipleSum(int limit) {
    int sum = 0;
    foreach (i; 0 .. limit) {
        if ((i % 3) == 0 || (i % 5) == 0) {
            sum += i;
        }
    }
    return sum;
}
