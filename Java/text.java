import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
public class text extends JFrame{
    private JTextField username,field2,field3;
    private JPasswordField password;
    private JLabel pass,user;
    private JButton button;
    public text()
    {
        super("Sign Up Page");
        setSize(500,500);
        setVisible(true);
        JPanel panel = new JPanel();
        panel.setLayout(null);
        Container container= getContentPane();
        container.setLayout( new FlowLayout());
        user= new JLabel("User Name");
       user.setBounds(100,8,70,20);
        panel.add(user);
        username= new JTextField("User Name");
       username.setBounds(100,27,70,20);
        panel.add(username);
        pass= new JLabel("User Name");
        pass.setBounds(100,55,70,20);
        panel.add(pass);
        password= new JPasswordField("User Name");
        password.setBounds(100,75,70,20);
        panel.add(password);
        button = new JButton();
        button.setBounds(100,100,70,20);
        button.setForeground(Color.pink);
        button.setBackground(Color.WHITE);
        button.addActionListener((ActionListener) new text());
        panel.add(button);
        @Override
        public void actionPerformed(ActionEvent e) {
        String Username = username.getText();
        String Password1 = password.getText();

        if (Username.equals("section.io") && Password1.equals("123"))
            JOptionPane.showMessageDialog(null, "Login Successful");
        else
            JOptionPane.showMessageDialog(null, "Username or Password mismatch ");
    }

    }
    public static void main(String[]args)
    {
        text application= new text();
        application.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    }
}