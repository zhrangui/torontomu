import java.util.ArrayList;
import java.util.List;

public class P2J15 {
    public static int[] findClosestElements(int[] a, int x, int k) {
        List<Integer> ak = new ArrayList<>();
        int l = 0;
        int u = a.length - 1;
        int m = (l + u) / 2;
        while (l < u) {
            if (a[m] == x) {
                break;
            } else if (a[m] > x) {
                u = m - 1;
            } else {
                l = m + 1;
            }
            m = (l + u) / 2;
        }
        ak.add(a[m]);
        l = 1;
        u = 1;
        for (int i = 1; i < k; ++i) {
            if (m + u >= a.length || m - l >= 0 && a[m] - a[m - l] <= a[m + u] - a[m]) {
                ak.add(a[m - l]);
                ++l;
            } else {
                ak.add(a[m + u]);
                ++u;
            }
        }
        return ak.stream().mapToInt(Integer::intValue).sorted().toArray();
    }

    public static int countSubarraysWithSum(int[] arr, int sum) {
        int count = 0;
        if (arr.length == 0) {
            return count;
        }
        int start = 0;
        int end = 1;
        int total = arr[0];
        while (end <= arr.length) {
            if (total > sum) {
                total -= arr[start];
                ++start;
            }else if (total < sum) {
                end += 1;
                if (end <= arr.length) {
                    total += arr[end-1];
                }
            } else {
                total -= arr[start];
                ++start;
                end += 1;
                if (end <= arr.length) {
                    total += arr[end-1];
                }
                ++count;
            }
        }
        return count;
    }
}
