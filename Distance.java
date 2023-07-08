import java.util.Map;
import java.util.TreeMap;

public class Distance {
    private TreeMap<Integer, Integer> coeff = new TreeMap<>();

    private Distance arithmetic(Distance other, boolean adding) {
        TreeMap<Integer, Integer> arithm = new TreeMap<>(coeff);
        for (Integer key : other.coeff.keySet()) {
            int value = arithm.getOrDefault(key, 0);
            if (adding) {
                arithm.put(key, value + other.coeff.get(key));
            } else {
                arithm.put(key, value - other.coeff.get(key));
            }
        }
        return new Distance(arithm);
    }

    public static int extractSquares(int n) {
        int sqrt = (int) Math.sqrt(n);
        int factor = 1;
        for (int i = 2; i <= sqrt; i++) {
            int sqr = i * i;
            while (n % sqr == 0) {
                factor *= i;
                sqrt /= i;
                n /= sqr;
            }
        }
        return factor;
    }

    public Distance(int a, int b) {
        Integer f = extractSquares(b);
        coeff.put(b / (f * f), a * f);
    }

    public Distance(Map<Integer, Integer> coeff) {
        for (Integer key : coeff.keySet()) {
            int f = extractSquares(key);
            int k = key / (f * f);
            int value = this.coeff.getOrDefault(k, 0);
            this.coeff.put(k, value + coeff.get(key) * f);
        }
    }

    public Distance add(Distance other) {
        return arithmetic(other, true);
    }

    public Distance subtract(Distance other) {
        return arithmetic(other, false);
    }

    public Distance multiply(Distance other) {
        TreeMap<Integer, Integer> mult = new TreeMap<>();
        for (Integer key : coeff.keySet()) {
            for (Integer otherKey : other.coeff.keySet()) {
                int value = mult.getOrDefault(key * otherKey, 0);
                mult.put(key * otherKey, value + coeff.get(key) * other.coeff.get(otherKey));
            }
        }
        return new Distance(mult);
    }

    @Override
    public String toString() {
        StringBuffer sb = new StringBuffer();
        for (Integer key : coeff.keySet()) {
            if (coeff.get(key) == 0) {
                continue;
            }
            if (sb.isEmpty()) {
                if (key == 1) {
                    sb.append(coeff.get(key));
                    continue;
                } else if ((coeff.get(key) < 0)) {
                    sb.append("-");
                }
            } else {
                if (coeff.get(key) > 0) {
                    sb.append(" + ");
                } else if ((coeff.get(key) < 0)) {
                    sb.append(" - ");
                }
            }

            if (coeff.get(key) != 1 && coeff.get(key) != -1) {
                sb.append(Math.abs(coeff.get(key)));
            }

            if (key != 1) {
                sb.append("Sqrt[" + key + "]");
            }
        }

        if (sb.isEmpty()) {
            sb.append("0");
        }
        return sb.toString();
    }
}
