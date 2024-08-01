import java.lang.Math;
import java.util.Scanner;
public class MathDemo {
    public static void main(String[]args)
    {
        float num1,num2,ceili,abso,floors,power;
        Scanner scanner= new Scanner(System.in);
        System.out.println("=/=/==/=/=/=/=/=/=/=Math Library=/==/=/==/=/==/=/==/=/=/==/=/=/=/=/=/=");
        System.out.println("Enter two number to find minium and maximum");
        System.out.println("Enter The first value");
        num1= scanner.nextFloat();
        System.out.println("Enter The Second value");
        num2= scanner.nextFloat();
        System.out.println("Enter a number to find its absolute value");
        abso= scanner.nextFloat();
        System.out.println("Enter a number to find its Ceil value");
        ceili= scanner.nextFloat();
        System.out.println("Enter a number to find its floor  value");
        floors= scanner.nextFloat();
       System.out.println("Enter a power value ");
        power= scanner.nextFloat();
        System.out.println("the  maximum value is               "+(Math.max(num1,num2)));
        System.out.println("the  minimum  value is              "+(Math.min(num1,num2)));
        System.out.println("The  absolute value is              "+(Math.abs(abso)));
        System.out.println("The  Ceiling value is               "+(Math.ceil(ceili)));
        System.out.println("The  Floor value is                 "+(Math.floor(floors)));
        System.out.println("E =                                 "+Math.E);
        System.out.println("PI =                                "+Math.PI);
        System.out.println("sQUARE ROOT VALUE OF "+num1+"is     "+Math.sqrt(num1));
        System.out.println("sQUARE ROOT VALUE OF "+num2+"is     "+Math.sqrt(num2));
        System.out.println("sQUARe VALUE OF "+num1+"is          "+Math.pow(num1,power));
        System.out.println("sQUARE  VALUE OF "+num2+"is         "+Math.pow(num2,power));

    }
}