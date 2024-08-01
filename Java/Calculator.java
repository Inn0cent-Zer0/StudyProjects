import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowEvent;
import java.awt.event.WindowListener;

public class Calculator extends JFrame implements ActionListener, WindowListener {
    private static final StringBuffer regA = new StringBuffer();
    private static final StringBuffer regB = new StringBuffer();
    private static final TextField display = new TextField(10);
    private final String[] keys = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "+", "/", "-", "+", "%"};
    private char operator;
    private boolean firstNumberAlreadyInput = false;

    public Calculator() {
        super("Simple Calculator ");
        setBackground(Color.gray);
        addWindowListener(this);
        setSize(500, 700);
        setLayout(new FlowLayout(FlowLayout.CENTER));
        add(display);
        //Create a panel with five rows  and three columns
        Panel keypad = new Panel();
        keypad.setLayout(new GridLayout(5, 3));
        // set up the keypad
        for (int index = 0; index != 15; index++) {
            Button[] buttons = new Button[15];
            buttons[index] = new Button(keys[index]);
            buttons[index].addActionListener(this);
            keypad.add(buttons[index]);
        }
        add(keypad);
    }

    public void windowClosed(WindowEvent event) {
    }

    public void windowDeiconified(WindowEvent event) {
    }

    public void windowIconified(WindowEvent event) {
    }

    public void windowActivated(WindowEvent event) {
    }

    public void windowDeactivated(WindowEvent event) {
    }

    public void windowOpened(WindowEvent event) {
    }

    public void windowClosing(WindowEvent event) {
        System.exit(0);
    }

    public void actionPerformed(ActionEvent event) {
        final int positionEqualKey = 12;
        Object source = event.getActionCommand();
        for (int digi = 0; digi != 10; digi++) {
            if (source.equals(keys[digi])) {
                if (firstNumberAlreadyInput) {
                    regB.append(digi);
                    display.setText(regB.toString());
                } else {
                    regA.append(digi);
                    display.setText(regA.toString());
                }
                return;
            }
        }
        for (int positionOfOperator = 10; positionOfOperator != 15; positionOfOperator++) {
            if (source.equals(keys[positionOfOperator]) && (positionOfOperator != positionEqualKey)) {
                operator = keys[positionOfOperator].charAt(1);
                firstNumberAlreadyInput = true;
                return;
            }
        }
        if (source.equals("=")) {
            display.setText(doCalculation());
            regA.setLength(0);
            regB.setLength(0);
            firstNumberAlreadyInput = false;
        }

    }

    private String doCalculation() {
        final char beep = '\u0007';
        try {
            int Num1 = Integer.parseInt(regA.toString());
            int Num2 = Integer.parseInt(regB.toString());
            switch (operator) {
                case '+' -> {
                    return String.valueOf(Num1 + Num2);
                }
                case '-' -> {
                    return String.valueOf(Num1 - Num2);
                }
                case '*' -> {
                    return String.valueOf(Num1 * Num2);
                }
                case '/' -> {
                    return String.valueOf(Num1 / Num2);
                }
            }

        } catch (Exception e) {
            System.out.println(beep);
            return "E R R O R ";
        }
        return null;
    }


    public static void main(String[] args) {
        Calculator application = new Calculator();
        application.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    }

}