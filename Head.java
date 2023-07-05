import java.awt.BasicStroke;
import java.awt.Dimension;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.geom.Ellipse2D;
import java.awt.geom.Line2D;
import java.awt.geom.Rectangle2D;

import javax.swing.BorderFactory;
import javax.swing.JPanel;
import javax.swing.border.BevelBorder;

public class Head extends JPanel {

    private boolean mouseInside;

    private final MyMouseListener myMouseListener;

    private class MyMouseListener extends MouseAdapter {
        @Override
        public void mouseEntered(MouseEvent e) {
            mouseInside = true;
            super.mouseEntered(e);
            repaint();
        }

        @Override
        public void mouseExited(MouseEvent e) {
            mouseInside = false;
            super.mouseExited(e);
            repaint();
        }
    }

    public Head() {
        // The one setting you must provide for your custom Swing component.
        this.setPreferredSize(new Dimension(500, 500));
        // Many other settings and options can also be given.
        this.setBorder(BorderFactory.createBevelBorder(BevelBorder.RAISED));
        this.myMouseListener = new MyMouseListener();
        this.addMouseListener(this.myMouseListener);
    }

    /**
     * Render this component as it currently looks like.
     * 
     * @param g The {@code Graphics} object provided by Swing for us to draw on.
     */
    @Override
    public void paintComponent(Graphics g) {
        super.paintComponent(g);
        Graphics2D g2 = (Graphics2D) g;
        g2.setRenderingHint(
                RenderingHints.KEY_ANTIALIASING,
                RenderingHints.VALUE_ANTIALIAS_ON);
        g2.setStroke(new BasicStroke(3.0f, BasicStroke.CAP_BUTT, BasicStroke.JOIN_ROUND));
        Rectangle2D.Double rect = new Rectangle2D.Double(210, 350, 100, 50);
        g2.draw(rect); // Outline
        if (mouseInside) {

            Ellipse2D.Double lElli = new Ellipse2D.Double(150, 150, 50, 50);
            g2.drawOval(150, 150, 50, 50);
            g2.draw(lElli);
            Ellipse2D.Double rElli = new Ellipse2D.Double(325, 150, 50, 50);
            g2.draw(rElli);

        } else {
            Line2D.Double lLine = new Line2D.Double(150, 175, 200, 175);
            g2.draw(lLine);
            Line2D.Double rLine = new Line2D.Double(325, 175, 375, 175);
            g2.draw(rLine);
        }
        Ellipse2D.Double elli = new Ellipse2D.Double(50, 50, 400, 400);
        g2.setStroke(new BasicStroke(5.0f, BasicStroke.CAP_BUTT, BasicStroke.JOIN_ROUND));
        g2.draw(elli);
    }
}