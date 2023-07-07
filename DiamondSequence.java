import java.util.Iterator;

public class DiamondSequence implements Iterator<Integer> {

    private long k;
    private long sum;
    private NatSet natSet;

    public DiamondSequence() {
        k = 0;
        sum = 0;
        natSet = new NatSet();
    }

    @Override
    public boolean hasNext() {
        return true;
    }

    @Override
    public Integer next() {
        ++k;
        long timeK = k;
        long i = sum / k;
        while (timeK < sum || natSet.contains(timeK - sum)) {
            timeK = k * i;
            ++i;
        }
        long sub = timeK - sum;
        natSet.add(sub);
        sum = timeK;
        return (int) sub;
    }
}
