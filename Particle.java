import java.util.Random;

public class Particle {
    private static final Random rng = new Random();
    private static final double BUZZY = 0.7;
    double x, y, heading;

    public Particle(int width, int height) {
        x = width*rng.nextDouble();
        y = height*rng.nextDouble();
        heading = Math.PI * 2 * rng.nextDouble();
    }

    public double getX() {
        return x;
    }

    public double getY() {
        return y;
    }

    public void move() {
        x += Math.cos(this.heading);
        y += Math.sin(this.heading);
        this.heading += rng.nextGaussian()*BUZZY;
    }
}
