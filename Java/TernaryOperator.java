import java.util.*;
public class TernaryOperator {
    public  static void main(String[]args)
    {
        int num1,num2;
        Scanner scan = new Scanner(System.in);
        System.out.println("Enter The First Value");
        num1= scan.nextInt();
         System.out.println("Enter The Second Value");
        num2= scan.nextInt();
        System.out.println((num1>num2 ?num1 : num2));

    }
}