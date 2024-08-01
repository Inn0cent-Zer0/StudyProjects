import javax.swing.*;
import java.awt.*;

public class Fonts extends JFrame {

    // Create a constructor to display text in the windows toolbar
    public Fonts() {
        super("Fonts in Java GUI Programming");
        setSize(420, 135);
        setVisible(true);
    }

    public static void main(String[] args) {
        Fonts application = new Fonts();
        application.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    }

    // create a paint method to set the font
    public void paint(Graphics g) {
        super.paint(g);
        // Times New Roman 24pt
        g.setColor(Color.MAGENTA);
        g.setFont(new java.awt.Font("Times", Font.ITALIC, 24));
        g.drawString("JAI SHREE GANESH", 20, 50);
        // Courier New 24PT
        g.setColor(Color.CYAN);
        g.setFont(new java.awt.Font("Courier New", Font.BOLD, 24));
        g.drawString("JAI SHREE GANESH", 20, 70);
        // MONSPACE 24PT
        g.setColor(Color.GREEN);
        g.setFont(new java.awt.Font("Monospaced", Font.ITALIC + Font.BOLD, 24));
        g.drawString("JAI SHREE GANESH", 20, 90);
        // Times New Roman 56pt
        g.setColor(Color.ORANGE);
        g.setFont(new java.awt.Font("Times", Font.ITALIC, 24));
        g.drawString("JAI SHREE GANESH", 20, 110);
        // Courier New 76pt
        g.setColor(Color.RED);
        g.setFont(new java.awt.Font("Serif", Font.BOLD, 24));
        g.drawString("JAI SHREE GANESH", 20, 130);
        // MONSPACE 80pt
        g.setColor(Color.PINK);
        g.setFont(new java.awt.Font("SansSerif", Font.PLAIN, 24));
        g.drawString("JAI SHREE GANESH", 20, 150);


    }
}