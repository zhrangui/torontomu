import java.util.HashSet;

public class P2J2 {
    public static String removeDuplicates(String text) {
        StringBuilder result = new StringBuilder();
        if (text.length() > 0) {
            result.append(text.charAt(0));
        }
        for (int i = 1; i < text.length(); i++) {
            if (result.charAt(result.length() - 1) != text.charAt(i)) {
                result.append(text.charAt(i));
            }
        }
        return result.toString();
    }

    public static String uniqueCharacters(String text) {
        StringBuilder result = new StringBuilder();
        HashSet<Character> uniqCchars = new HashSet<>();

        for (int i = 0; i < text.length(); i++) {
            if (!uniqCchars.contains(text.charAt(i))) {
                result.append(text.charAt(i));
                uniqCchars.add(text.charAt(i));
            }
        }
        return result.toString();
    }

    public static int countSafeSquaresRooks(int n, boolean[][] rooks) {
        boolean[] safeRow = new boolean[n];
        boolean[] safeCols = new boolean[n];
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                if (rooks[i][j]) {
                    safeRow[i] = rooks[i][j];
                    safeCols[j] = rooks[i][j];
                }
            }
        }
        int rowCount = 0;
        int colCount = 0;
        for (int i = 0; i < n; i++) {
            if (!safeRow[i]) {
                rowCount++;
            }
            if (!safeCols[i]) {
                colCount++;
            }
        }
        return rowCount * colCount;
    }

    public static int recaman(int n) {
        boolean[] counted = new boolean[10*n];
        int prev = 0;
        for (int i = 1; i<=n; i++) {
            if (prev > i && !counted[prev - i]) {
               prev -= i;
            } else {
                prev += i;
            }
            counted[prev] = true;
        }
        return prev;
    }
}
