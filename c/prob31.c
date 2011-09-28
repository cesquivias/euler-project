#include <stdio.h>

int main() {
    int c100, c50, c20, c10, c5, c2, c1;
    int total = 1; // The 200p coin is one possiblity
    for (c100=0; c100<3; c100++) {
        for (c50=0; c50<5; c50++) {
            for (c20=0; c20<11; c20++) {
                for (c10=0; c10<21; c10++) {
                    for (c5=0; c5<41; c5++) {
                        for (c2=0; c2<101; c2++) {
                            for (c1=0; c1<201; c1++) {
                                if (((c100 * 100) + (c50 * 50) + (c20 * 20) +
                                     (c10 * 10) + (c5 * 5) + (c2 * 2) + c1)
                                    == 200) {
                                    total += 1;
                                }
                            }
                        }
                    }
                }                    
            }
        }
    }
    printf("%d\n", total);
    return 0;
}
