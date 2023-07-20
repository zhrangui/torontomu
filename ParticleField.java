import java.awt.Dimension;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.Rectangle;
import java.awt.RenderingHints;
import java.util.ArrayList;
import java.util.List;

import javax.swing.JPanel;

public class ParticleField extends JPanel {
    private boolean running = true;
    private List<Particle> particles = new ArrayList<Particle>();

    public ParticleField(int n, int width, int height) {
        particles = new ArrayList<>(n);
        this.setPreferredSize(new Dimension(width, height));
        for (int i = 0; i < n; ++i) {
            particles.add(new Particle(width, height));
        }
        new Thread(new Animation()).start();
    }

    private class Animation implements Runnable {
        public void run() {
            while (running) {
                try {
                    Thread.sleep(20);
                } catch (InterruptedException ex) {

                }
                for (Particle pt : particles) {
                    pt.move();
                }
                repaint();
            }
        }
    }
     @Override public void paintComponent(Graphics g) {
        super.paintComponent(g);
        Graphics2D g2 = (Graphics2D) g;
        g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
        for (Particle pt: particles) {
            g2.fill(new Rectangle.Double(pt.getX()-1,pt.getY()-1, 3, 3));
        }
     }

     public void terminate() {
        this.running = false;
     }
}
