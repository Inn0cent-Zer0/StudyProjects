import java.util.Scanner;

public class Hex {
    public static void main(String[]args)
    {
        int num1,num2,sum;
        String oct,oct1,bin,bin1,hex,hex1;
        int a,b,c,d,e,f,g,h,i;
        Scanner scanner= new Scanner(System.in);
        System.out.println("=/=/==/=/=/=/=/=/=/=Conversion=/==/=/==/=/==/=/==/=/=/==/=/=/=/=/=/=");
        System.out.println("Enter two number to find minium and maximum");
        System.out.println("Enter The first value");
        num1= scanner.nextInt();
        System.out.println("Enter The Second value");
        num2= scanner.nextInt();
        hex= Integer.toHexString(num1);
        System.out.println("Hex1 Value   "+hex);
        hex1= Integer.toHexString(num2);
        System.out.println("Hex2 Value   "+hex1);
        oct=Integer.toOctalString(num1);
        System.out.println("Oct1 Value   "+oct);
        oct1=Integer.toOctalString(num2);
        System.out.println("Oct2 Value   "+oct1);
        bin=Integer.toBinaryString(num1);
        System.out.println("Bin1 Value   "+bin);
        bin1=Integer.toBinaryString(num2);
        System.out.println("Bin2 Value   "+bin1);
        a=Integer.parseInt(hex);
       b = Integer.parseInt(hex1);
        c=Integer.parseInt(oct);
       d = Integer.parseInt(oct1);
        e=Integer.parseInt(bin);
       f = Integer.parseInt(bin1);
       sum= a+b+c+d+e+f;
        System.out.println(" SUM VALUE   "+sum);
    }
}