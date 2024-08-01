import java.awt.*;
import javax.swing.*;
public class Rainbow extends JPanel{
    static final Color Violet= new Color(128,0,128);
    static final Color Indigo= new Color(75,0,130);
    private final Color[] colors ={Color.white,Color.WHITE,Violet,Indigo,Color.BLUE,Color.GREEN,Color.YELLOW,Color.orange,Color.ORANGE};
    public Rainbow()
    {
        setBackground(Color.BLACK);
    }
    public void paintComponent(Graphics g)
    {
        super.paintComponent(g);
        int radius=20;

        //draws a rainbow near the bottom-center
        int Centerx=getWidth()/2;
        int Centery=getHeight()-10;
        for(int count=colors.length;count>0;count--)
        {
            g.setColor(colors[count-1]);
            g.fillArc(Centerx-count*radius,Centery-count*radius,count*radius*2,count*radius*2,0,180);

        }

    }
    public static void main(String[]args)
    {
        Rainbow panel= new Rainbow();
        JFrame Application = new JFrame("Rainbow");
        Application.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        Application.add(panel);
        Application.setSize(400,250);
        Application.setVisible(true);

    }
}