import java.util.ArrayList;
import java.util.List;

public class Primes {
    private static List<Integer> primes = new ArrayList<>();
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

    public static boolean isPrime_(int number) {
        if (number <= 1) {
            return false;
        }

        // Check if number is divisible by any previously computed prime
        for (int prime : primes) {
            if (number % prime == 0) {
                return false;
            }
        }

        // Compute new primes up to the given number
        for (int i = primes.isEmpty() ? 2 : primes.get(primes.size() - 1) + 1; i <= number; i++) {
            boolean isPrime = true;
            for (int prime : primes) {
                if (i % prime == 0) {
                    isPrime = false;
                    break;
                }
            }
            if (isPrime) {
                primes.add(i);
                if (number % i == 0) {
                    return false;
                }
            }
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
