public class P2J1 {
    public static long fallingPower(int n, int k) {
        long power = 1;
        for (int i = 0; i < k; i++) {
            power *= (n - i);
        }
        return power;
    }

    public static int[] everyOther(int[] arr) {
        int[] arr2 = new int[(arr.length + 1) / 2];
        for (int i = 0; i * 2 < arr.length; i++) {
            arr2[i] = arr[i * 2];
        }
        return arr2;
    }

    public static int[][] createZigZag(int rows, int cols, int start) {
        int[][] arr = new int[rows][cols];
        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < cols; j++) {
                if (i % 2 == 0) {
                    arr[i][j] = start + i * cols + j;
                } else {
                    arr[i][j] = start + (i + 1) * cols - j - 1;
                }
            }
        }
        return arr;
    }

    public static int countInversions(int[] arr) {
        int count = 0;

        for (int i = 1; i < arr.length; i++) {
            for (int j = 0; j < i; j++) {
                if (arr[j] > arr[i]) {
                    count += 1;
                }
            }
        }
        return count;
    }
}
