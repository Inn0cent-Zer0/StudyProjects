import java.util.Scanner;

public class Hypo {
    public static void main(String[]args)
    {
        float side1,side2;
        double hypo;
        Scanner scanner= new Scanner(System.in);
        System.out.println("=/=/==/=/=/=/=/=/=/=Hypotenuse=/==/=/==/=/==/=/==/=/=/==/=/=/=/=/=/=");
        System.out.println("Enter two number to find The Hypotenuse of the  Triangle");
        System.out.println("Enter The first value");
        side1= scanner.nextFloat();
        System.out.println("Enter The Second value");
        side2= scanner.nextFloat();
        hypo=(Math.pow(side1,2)+Math.pow(side2,2));
        System.out.println("The sides are  "+side1+"  and   "+side2);
        System.out.println("The Hypotenuse value of the given values is "+hypo);
    }
}