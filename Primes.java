import java.util.ArrayList;
import java.util.List;

public class Primes {
    public static boolean isPrime(int n) {
        List<Integer> primes = new ArrayList<>();
        int nRoot = (int) Math.ceil(Math.sqrt(n));

        for (int i = 2; i <= nRoot; ++i) {
            int root = (int) Math.ceil(Math.sqrt(i));
            boolean prime = true;
            for (Integer p : primes) {
                if (p <= root) {
                    if (i % p == 0) {
                        prime = false;
                        break;
                    }
                } else {
                    break;
                }
            }
            if (prime) {
                if (n % i == 0) {
                    return false;
                }
                primes.add(i);
            }
            prime = true;
        }
        return true;
    }

    public static int kthPrime(int k) {
        throw new UnsupportedOperationException();
    }

    public static List<Integer> factorize(int n) {
        throw new UnsupportedOperationException();
    }
}
