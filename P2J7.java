import java.math.BigInteger;
import java.util.Arrays;
import java.util.Comparator;
import java.util.LinkedList;
import java.util.List;
import java.util.PriorityQueue;

public class P2J7 {
    public static <T> List<T> josephus(List<T> men, int k) {
        LinkedList<T> removableMen = new LinkedList<>(men);
        LinkedList<T> killedMen = new LinkedList<>();
        int len;
        int index = 0;
        while (!removableMen.isEmpty()) {
            len = removableMen.size();
            index = (index + k - 1) % len;
            killedMen.add(removableMen.get(index));
            removableMen.remove(index);
        }
        return killedMen;
    }

    public static int[] huntingtonHill(int[] population, int seats) {
        PriorityQueue<Fraction> pq = new PriorityQueue<>(Comparator.reverseOrder());
        BigInteger[] dbPopulation = new BigInteger[population.length]; 
        int[] sp = new int[population.length];
        Arrays.fill(sp, 1);
        seats -= population.length;

        for (int i = 0; i < population.length; ++i) {
            BigInteger num = BigInteger.valueOf(population[i]);
            num = num.multiply(num); 
            Fraction f = new Fraction(num, BigInteger.valueOf(2));
            dbPopulation[i] = f.getNum();
            pq.offer(f);
        }

        for (int i=0; i < seats; ++i) {
            Fraction top = pq.poll();
            BigInteger num = top.getNum();
            for (int j = 0; j<dbPopulation.length; ++j) {
                if (num == dbPopulation[j]){
                    sp[j] += 1;
                    BigInteger n = BigInteger.valueOf(population[j]);
                    n = n.multiply(n);
                    BigInteger bSp =  BigInteger.valueOf(sp[j]);
                    Fraction f = new Fraction(n,bSp.multiply(bSp.add(BigInteger.valueOf(1))));
                    dbPopulation[j] = f.getNum();
                    pq.add(f);
                    break;
                }
            }
        }
        return sp;
    }
}
