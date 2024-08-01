import java.util.Scanner;

public class DoubleDemo
{
    public static void main(String[]args)
    {
        double d1,d2;
        Scanner scanner= new Scanner(System.in);
        System.out.println("=/=/==/=/=/=/=/=/=/=Conversion=/==/=/==/=/==/=/==/=/=/==/=/=/=/=/=/=");
        System.out.println("Enter two number to find minium and maximum");
        System.out.println("Enter The first value");
        d1= scanner.nextDouble();
        System.out.println("Enter The Second value");
       d2= scanner.nextDouble();
       double d3= d1/d2;
       System.out.println(d3);
       System.out.println(Double.isFinite(d3));
       System.out.println(Double.isInfinite(d3));
       System.out.println(Double.isNaN(d3));
       System.out.println(Double.MIN_VALUE);
       System.out.println(Double.MAX_VALUE);
       System.out.println(Double.POSITIVE_INFINITY);
       System.out.println(Double.NEGATIVE_INFINITY);

    }
}