import javax.swing.*;
import java.awt.*;

// Create a m,ain class named after the file name and extend from hte class JFrame tio use methods of JFrame and Swing
public class graphics extends JFrame {
    // Create a Constructor  to display text in the window title bar
    public graphics() {
        // Use the super method to display text in windows title bar
        super("Displaying Colors");
        //Use the setSize method to set size of the window title bar. This method has width,height arguments
        setSize(400, 130);
        // Use the setVisible method to set the visibility of the title bar this has  boolean arguments
    }

    // end of method paint
    public static void main(String[] args) {
        graphics application = new graphics();
        application.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    }

    // create a method called paint to display colors in boxes and pass Graphic g as an argument
    public void paint(Graphics g) {
        // call the super class's paint method
        super.paint(g);
        // Taking g as a object
        // Use the setColor, fillRect, drawString method to draw rectangles, strings  each different color
        // Set new Color using integer values
        // IF WE NOTICE THE BELOW WE WILL UNDERSTAND THAT THE VALUE IN THE  DRAW STRING GET COLOR X VALUE IS THE SAME
        // WHEREAS THE Y VALUE ALONE CHANGES
        g.setColor(new Color(255, 0, 0));
        g.fillRect(25, 25, 100, 20);
        g.drawString("Current RGB Value:" + g.getColor(), 130, 40);
        // Set new Color using float values
        g.setColor(new Color(0.0f, 1.0f, 0.0f));
        g.fillRect(25, 50, 100, 20);
        g.drawString("Current RGB Value:" + g.getColor(), 130, 65);
        // Set new Color using static color object values
        g.setColor(Color.BLUE);
        g.fillRect(25, 75, 100, 20);
        g.drawString("Current RGB Value:" + g.getColor(), 130, 90);
        // Set new Color using RGB
        Color color = Color.MAGENTA;
        g.setColor(color);
        g.fillRect(25, 100, 100, 20);
        g.drawString("Current RGB Value:" + color.getRed() + "," + color.getGreen() + "," + color.getBlue(), 130, 115);
    }
}
// END OF GRAPHICS CLASS