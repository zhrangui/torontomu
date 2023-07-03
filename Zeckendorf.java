import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class Zeckendorf {

    private static List<BigInteger> fibs = new ArrayList<>();
    static {
        fibs.add(BigInteger.ONE);
        fibs.add(BigInteger.TWO);
    }

    private static void setFibonacci(BigInteger n) {
        while (fibs.get(fibs.size() - 1).compareTo(n) < 0) {
            int s = fibs.size();
            fibs.add(fibs.get(s - 1).add(fibs.get(s - 2)));
        }
    }

    private static BigInteger getFibonacci(int n) {
        int s;
        while ((s = fibs.size()) < n + 1) {
            fibs.add(fibs.get(s - 1).add(fibs.get(s - 2)));
        }
        return fibs.get(n);
    }

    public static List<Integer> fibonacciSum(BigInteger n) {
        setFibonacci(n);
        List<Integer> result = new ArrayList<>();
        int i = Collections.binarySearch(fibs, n);
        if (i >= 0) {
            result.add(i);
            return result;
        }
        i = -i - 2;
        while (n.compareTo(BigInteger.ZERO) > 0) {
            if (n.compareTo(fibs.get(i)) >= 0) {
                result.add(i);
                n = n.subtract(fibs.get(i));
                i -= 2;
            } else {
                i -= 1;
            }
        }
        return result;
    }

    public static String encode(List<BigInteger> items) {
        StringBuilder result = new StringBuilder();
        for (BigInteger item : items) {
            List<Integer> fibs = fibonacciSum(item);
            for (int j = 0; j < fibs.get(fibs.size() - 1); ++j) {
                result.append('0');
            }
            for (int i = fibs.size() - 1; i >= 0; --i) {
                result.append('1');
                if (i > 0) {
                    for (int j = 0; j < fibs.get(i - 1) - fibs.get(i) - 1; ++j) {
                        result.append('0');
                    }
                }
            }
            result.append('1');

        }
        return result.toString();
    }

    public static List<BigInteger> decode(String zits) {
        ArrayList<String> fibZits = new ArrayList<>();
        StringBuilder fibBit = new StringBuilder();
        Character p = null;
        for (int i = 0; i < zits.length(); ++i) {
            Character c = zits.charAt(i);
            if (c == '1' && p != null && p == '1') {
                p = null;
                fibZits.add(fibBit.toString());
                fibBit.setLength(0);
                continue;
            }
            fibBit.append(c);
            p = c;
        }

        List<BigInteger> fibs = new ArrayList<>();
        for (String zit : fibZits) {
            BigInteger fib = BigInteger.ZERO;
            for (int i = 0; i < zit.length(); ++i) {
                if (zit.charAt(i) == '1') {
                    fib = fib.add(getFibonacci(i));
                }
            }
            fibs.add(fib);
        }
        return fibs;
    }
}
