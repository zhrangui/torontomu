import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class Manhattan {

    public static int compare(Integer num1, Integer num2) {
        return Integer.compare(num2, num1);
    }

    public static int totalArea(int[] s, int[] e, int[] h) {
        List<Integer> events = new ArrayList<>();
        Set<Integer> active = new HashSet<>();

        for (int i = 0; i < s.length; ++i) {
            events.add(-i - 1);
            events.add(i + 1);
        }

        events.sort((x, y) -> {
            int cx, cy;
            if (x > 0) {
                cx = e[x - 1];
            } else {
                cx = s[-x - 1];
            }
            if (y > 0) {
                cy = e[y - 1];
            } else {
                cy = s[-y - 1];
            }
            return Integer.compare(cx, cy);
        });

        int x = 0;
        int cx;
        int area = 0;
        int height = 0;

        for (int i = 0; i < events.size(); ++i) {
            if (events.get(i) < 0) {
                cx = s[-events.get(i) - 1];
            } else {
                cx = e[events.get(i) - 1];
            }
            area += (cx - x) * height;
            if (events.get(i) < 0) {
                active.add(-events.get(i));
                if (active.size() > 0) {
                    height = 0;
                    for (int act : active) {
                        if (height < h[act - 1]) {
                            height = h[act - 1];
                        }
                    }
                }
            } else {
                active.remove(events.get(i));
                height = 0;
                for (int act : active) {
                    if (height < h[act - 1]) {
                        height = h[act - 1];
                    }
                }
            }
            x = cx;
        }
        return area;
    }
}
