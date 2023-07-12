import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

public class P2J6 {

    private static boolean sumOfDistinctCubes(int n, int c, LinkedList<Integer> soFar) {
        if (n == 0) {
            return true;
        } else if (n < 0) {
            return false;
        }
        for (int i = c; i > 0; --i) {
            boolean isSuccess = sumOfDistinctCubes(n - i * i * i, i - 1, soFar);
            if (isSuccess) {
                soFar.addFirst(i);
                return isSuccess;
            }
        }
        return false;
    }

    public static List<Integer> sumOfDistinctCubes(int n) {
        LinkedList<Integer> soFar = new LinkedList<>();
        int c = (int) Math.cbrt(n);
        if (sumOfDistinctCubes(n, c, soFar)) {
            return soFar;
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
