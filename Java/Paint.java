import java.util.Scanner;
public class Paint {
    public static void main(String [] args)
    {
        float Length,Width,Height,Wall_Area,Door_Area,Paint,Cans,Window_Area;
        Scanner scan = new Scanner(System.in);
        System.out.println("\n\t======//Enter the Details of The Building//========");
        System.out.println("\n\tEnter The Length :");
        Length = scan.nextFloat();
       System.out.println("\n\tEnter The Width :");
        Width = scan.nextFloat();
       System.out.println("\n\tEnter The Height:");
        Height= scan.nextFloat();
       System.out.println("\n\tEnter The Total Area of The Door :");
        Door_Area = scan.nextFloat();
        System.out.println("\n\tEnter The Total Area of The Window:");
        Window_Area = scan.nextFloat();
        System.out.println("\n\tEnter The Paint Amount  :");
        Paint = scan.nextFloat();
        Wall_Area =2 * Height *(Width+ Length)-(Window_Area + Door_Area);
        Cans = Wall_Area/ Paint;
        System.out.println("\n\t======//Statistics about The Paint Required to Paint The Walls of A Room//========");
        System.out.println("\n\t Length                        :"+Length);
        System.out.println("\n\t Width                         :"+Width);
        System.out.println("\n\t Height                        :"+Height);
        System.out.println("\n\tTotal Area of The Wall         :"+Wall_Area);
        System.out.println("\n\tTotal Area of The Door         :"+Door_Area);
        System.out.println("\n\tTotal Area of The Window       :"+Window_Area);
        System.out.println("\n\tPaint Amount                   :"+Paint);
        System.out.println("\n\tNumber of Cans Required to Paint The Room is   //"+Cans);
    }
}