import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

public class P2J6 {

    private static boolean sumOfDistinctCubes(int n, int c, LinkedList<Integer> soFar) {
        int rest = n - c * c * c;
        if (rest == 0) {
            return true;
        } else if (rest < 0) {
            return false;
        }
        int max = c-1;
        int min = 0;
        int sum = 0;
        while ((sum + min * min * min) < rest) {
            sum += min * min * min;
            ++min;
        }
        for (int i = max; i >= min; --i) {
            boolean isSuccess = sumOfDistinctCubes(rest, i, soFar);
            if (isSuccess) {
                soFar.addFirst(i);
                return isSuccess;
            }
        }
        return false;
    }

    public static List<Integer> sumOfDistinctCubes(int n) {
        LinkedList<Integer> soFar = new LinkedList<>();
        int max = (int) Math.cbrt(n);
        int min = 0;
        int sum = 0;
        while ((sum + min * min * min) < n) {
            sum += min * min * min;
            ++min;
        }

        for (int c = max; c >= min; --c) {
            if (sumOfDistinctCubes(n, c, soFar)) {
                soFar.addFirst(c);
                return soFar;
            }
        }
        return new LinkedList<>();
    }

    private static void forbiddenSubstrings(String alphabet, int n, List<String> tabu, String soFar,
            List<String> result) {
        if (soFar.length() == n) {
            result.add(soFar);
            return;
        }
        for (char ch : alphabet.toCharArray()) {
            String newSoFar = soFar + ch;
            boolean free = true;
            for (String t : tabu) {
                if (newSoFar.endsWith(t)) {
                    free = false;
                    break;
                }
            }
            if (free) {
                forbiddenSubstrings(alphabet, n, tabu, newSoFar, result);
            }
        }
    }

    public static List<String> forbiddenSubstrings(
            String alphabet, int n, List<String> tabu) {
        List<String> result = new ArrayList<>();
        for (char ch : alphabet.toCharArray()) {
            String soFar = "" + ch;
            forbiddenSubstrings(alphabet, n, tabu, soFar, result);
        }
        return result;
    }
}
