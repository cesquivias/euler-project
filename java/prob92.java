import java.util.HashMap;
import java.util.Map;

public class prob92 {
    Map<Long, Boolean> numbers = new HashMap<>();

    prob92() {
        numbers.put(1L, false);
        numbers.put(89L, true);
    }

    long nextNumber(long n) {
        int sum = 0;
        while (n != 0) {
            int d = (int) (n % 10);
            sum += d * d;
            n /= 10;
        }
        return sum;
    }

    boolean doesGoTo89Cache(long n) {
        if (numbers.containsKey(n)) {
            return numbers.get(n);
        }
        boolean goesTo89 = doesGoTo89(nextNumber(n));
        numbers.put(n, goesTo89);
        return goesTo89;
    }

    boolean doesGoTo89(long n) {
        long num = nextNumber(n);
        while (!numbers.containsKey(num)) {
            num = nextNumber(num);
        }
        return numbers.get(num);
    }

    public static void main(String[] args) {
        prob92 prob = new prob92();

        long count = 0;
        for (long i=1; i<1000; i++) {
            if (prob.doesGoTo89Cache(i)) {
                count++;
            }
        }
        for (long i=1000; i<10000000; i++) {
            if (prob.doesGoTo89(i)) {
                count++;
            }
        }
        System.out.println(count);
    }
}
