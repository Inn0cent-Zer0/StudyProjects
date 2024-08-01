import java.util.*;
public class leapyear {
    public static void main(String[]args)
    {
        int year;
        Scanner scan= new Scanner(System.in);
        System.out.println("\n\t\t+_+_+_+_+_+||Leap Year||+_+_+_+_+_+");
        System.out.println("\n\t\tEnter the Year :");
        year= scan.nextInt();
        if(year%4==0)
        {
            System.out.println("\n\t\t The Year "+year+" is a leap year ");
        }
        else if(year%100==0)
        {
            System.out.println("\n\t\t The Year "+year+" is a leap year ");
        }
        else if(year%400==0)
        {
            System.out.println("\n\t\t The Year "+year+" is a leap year ");
        }
        else
        {
            System.out.println("\n\t\t The Year "+year+" is  not a leap year ");
        }
    }
}