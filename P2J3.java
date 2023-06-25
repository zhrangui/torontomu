
public class P2J3 {
    public static void reverseAscendingSubarrays(int[] items) {
        int[] group = items.clone();
        boolean change;
        do {
            change = false;
            for (int i = 1; i < items.length; ++i) {
                if (group[i - 1] < group[i] && items[i - 1] < items[i]) {
                    int swap = items[i];
                    items[i] = items[i - 1];
                    items[i - 1] = swap;
                    change = true;
                }
            }
        } while (change);
    }

    public static String pancakeScramble(String text) {
        String cText = text;
        for (int i = 2; i <= text.length(); ++i) {
           cText = new StringBuilder(cText.substring(0, i)).reverse().toString() + cText.substring(i);
        }
        return cText.toString();
    }

    public static String reverseVowels(String text) {
        String vowels ="aeiouAEIOU";
        StringBuilder sText = new StringBuilder(text);
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < text.length(); ++i) {
            if (vowels.contains(String.valueOf(text.charAt(i)))) {
                sb.append(text.charAt(i));
            }
        }
        for (int i = 0; i < text.length(); ++i) {
            if (vowels.contains(String.valueOf(text.charAt(i)))) {

                Character v = sb.charAt(sb.length() - 1);
                sb.deleteCharAt(sb.length() - 1);
                if (Character.isLowerCase(text.charAt(i))) {
                    sText.setCharAt(i, Character.toLowerCase(v));
                }
                else {
                    sText.setCharAt(i, Character.toUpperCase(v));
                }
            }
        }
        return sText.toString();
    }
}
