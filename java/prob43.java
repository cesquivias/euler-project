import java.util.Arrays;

public class prob43 {
    public static boolean isDiv3(int d100, int d10, int d1) {
        return (100 * d100 + 10 * d10 + d1) % 3 == 0;
    }

    public static boolean isDiv7(int d100, int d10, int d1) {
        return (100 * d100 + 10 * d10 + d1) % 7 == 0;
    }

    public static boolean isDiv11(int d100, int d10, int d1) {
        return (100 * d100 + 10 * d10 + d1) % 11 == 0;
    }

    public static boolean isDiv13(int d100, int d10, int d1) {
        return (100 * d100 + 10 * d10 + d1) % 13 == 0;
    }

    public static boolean isDiv17(int d100, int d10, int d1) {
        return (100 * d100 + 10 * d10 + d1) % 17 == 0;
    }

    public static boolean isPandigital(int... digits) {
        Arrays.sort(digits);
        for (int i=0; i<10; i++) {
            if (digits[i] != i) {
                return false;
            }
        }
        return true;
    }

    public static void main(String[] args) {
        long sum = 0;
        for (int d1=1; d1<10; d1++) {
            for (int d2=0; d2<10; d2++) {
                for (int d3=0; d3<10; d3++) {
                    for (int d4=0; d4<10; d4++) {
                        if (d4 % 2 == 1) {
                            continue;
                        }
                        for (int d5=0; d5<10; d5++) {
                            if (!isDiv3(d3,d4,d5)) {
                                continue;
                            }
                            for (int d6=0; d6<10; d6++) {
                                if (!(d6 == 0 || d6 == 5)) {
                                    continue;
                                }
                                for (int d7=0; d7<10; d7++) {
                                    if (!isDiv7(d5,d6,d7)) {
                                        continue;
                                    }
                                    for (int d8=0; d8<10; d8++) {
                                        if (!isDiv11(d6,d7,d8)) {
                                            continue;
                                        }
                                        for (int d9=0; d9<10; d9++) {
                                            if (!isDiv13(d7,d8,d9)) {
                                                continue;
                                            }
                                            for (int d10=0; d10<10; d10++) {
                                                if (!isDiv17(d8,d9,d10)) {
                                                    continue;
                                                }
                                                if (isPandigital(d1,d2,d3,d4,d5,d6,d7,d8,d9,d10)) {
                                                    sum += d10;
                                                    sum += 10 * d9;
                                                    sum += 100 * d8;
                                                    sum += 1000 * d7;
                                                    sum += 10000 * d6;
                                                    sum += 100000 * d5;
                                                    sum += 1000000 * d4;
                                                    sum += 10000000 * d3;
                                                    sum += 100000000 * d2;
                                                    sum += 1000000000 * d1;
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        System.out.println(sum);
    }
}
