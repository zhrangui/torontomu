import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class P2J5 {
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

    public static List<BigInteger> fibonacciSum(BigInteger n) {
        setFibonacci(n);
        List<BigInteger> result = new ArrayList<>();
        int i = Collections.binarySearch(fibs, n);
        if (i >= 0) {
            result.add(fibs.get(i));
            return result;
        }
        i = -i - 2;
        while (n.compareTo(BigInteger.ZERO) > 0) {
            if (n.compareTo(fibs.get(i)) >= 0) {
                result.add(fibs.get(i));
                n = n.subtract(fibs.get(i));
                i -= 2;
            } else {
                i -= 1;
            }
        }
        return result;
    }

    public static BigInteger sevenZero(int n) {
        int length = String.valueOf(n).length();
        boolean zeroEnd = n % 5 == 0 || n % 2 == 0;
        BigInteger sevens = BigInteger.ZERO;
        BigInteger bgN = BigInteger.valueOf(n);
        while (length > 0) {
            if (zeroEnd) {
                sevens = BigInteger.ZERO;
                for (int i = 0; i < length; ++i) {
                    sevens = sevens.multiply(BigInteger.valueOf(10)).add(BigInteger.valueOf(7));
                    BigInteger result = sevens.multiply(BigInteger.valueOf(10).pow(length - i - 1));
                    if (result.remainder(bgN).equals(BigInteger.ZERO)) {
                        return result;
                    }
                }
            } else {
                sevens = sevens.multiply(BigInteger.valueOf(10)).add(BigInteger.valueOf(7));
                if (sevens.remainder(bgN).equals(BigInteger.ZERO)) {
                    return sevens;
                }
            }

            length += 1;
        }
        throw new UnsupportedOperationException();
    }
}
