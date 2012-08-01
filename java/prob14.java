import java.util.HashMap;

public class prob14 {
    static HashMap<Long,Long> cache = new HashMap<Long,Long>();
    static {
        cache.put(1L, 1L);
    }

    static long totalSteps(long start) {
        long i = start;
        long steps = 0;
        while (true) {
            if (cache.containsKey(i)) {
                long allSteps = steps + cache.get(i);
                cache.put(start, allSteps);
                return allSteps;
            } else if (i % 2 == 0) {
                steps++;
                i /= 2;
            } else {
                steps++;
                i = 3*i + 1;
            }
        }
    }

    static long prob14(long limit) {
        long max_n = 1;
        long max_steps = 1;
        for (long i=1; i<limit; i++) {
            long steps = totalSteps(i);
            if (steps > max_steps) {
                max_steps = steps;
                max_n = i;
            }
        }
        return max_n;
    }

    public static void main(String[] args) {
        System.out.println(prob14(Long.parseLong(args[0])));
    }
}
