import java.util.Arrays;

public class Polynomial {

    private int[] coefficients;

    @Override
    public String toString() {
        return getClass().getName() + coefficients;
    }

    public Polynomial(int[] coefficients) {
        int end = coefficients.length - 1;
        while (end > 0 && coefficients[end] == 0) {
            --end;
        }

        this.coefficients = (Arrays.copyOfRange(coefficients, 0, end + 1));
        if (this.coefficients.length == 0) {
            this.coefficients = new int[] { 0 };
        }
    }

    public int getDegree() {
        return this.coefficients.length - 1;
    }

    public int getCoefficient(int k) {
        return 0 <= k && k < this.coefficients.length ? this.coefficients[k] : 0;
    }

    public long evaluate(int x) {
        long result = 0;
        
        for (int i = this.coefficients.length - 1 ; i >= 0 ; --i) {
            result = result*x + this.coefficients[i];
        }
        return result;
    }
}
