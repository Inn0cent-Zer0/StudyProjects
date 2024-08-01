import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class Choose extends JFrame {
    private final Container container;
    private Color color;

    // create a constructor with no arguments to set up the GUI
    public Choose() {
        // use the super method to display text in window toolbar
        super("Change the color of the Content Pane ");
        container = getContentPane();
        container.setLayout(new FlowLayout());
        // set up the change color button and register it is  event handler
        // Assign the CHANGE color button to a new J BUTTON and give a string as argument
        // create a button, color, container
        JButton changeColorButton = new JButton("Change Color");
        changeColorButton.addActionListener(new ActionListener() { // this is an anonymous inner class
                    @Override
                    // to display JColorChooser when the user clicks on the change color button
                    public void actionPerformed(ActionEvent e) {
                        color = JColorChooser.showDialog(Choose.this, "Choose A Color", color);
                        //to set color if no value is returned
                        if (color == null) {
                            color = Color.LIGHT_GRAY;
                        }
                        // CHANGE THE BACKGROUND COLOR OF THE CONTENT PANE
                        container.setBackground(color);

                    }
                }
                // end of anonymous class
        );
        container.add(changeColorButton);
        setSize(400, 130);
        setVisible(true);
    }

    public static void main(String[] args) {
        Choose application = new Choose();
        application.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    }
}