//Java program to calculate and display the miles per gallon  obtained for each tankful and print
// the combined miles per gallon obtained for all tankfuls up to this point.
import java.util.Scanner;
public class Petrol {
    public static void main(String[]args)
    {
        // declare the miles driven and gallons used as integer
        int Miles_Driven,Gallons_Used,Option;
        // After calculation the result might be in float and will not get explicitly converted into another type
        double MPG, count, total = 0,avg=0;
        // Create a scanner object to get user input
        Scanner scanner= new Scanner(System.in);
        System. out.println("Please choose from the below ");
        System.out.println("1. Know the current stauts of the vehicle");
        System.out.println("0. Exit the process");
        Option= scanner.nextInt();
        while(Option!=0) {
            System. out.println("Please choose from the below ");
            System.out.println("1. Know the current stauts of the vehicle");
            System.out.println("0. Exit the process");
            Option= scanner.nextInt();
            if(Option==0)
                break;
            System.out.println("Enter the Miles Driven Since a tankful :");
            Miles_Driven = scanner.nextInt();
            System.out.println("Enter the gallons of fuel to be used :");
            Gallons_Used = scanner.nextInt();
            // MILES PER HPUR
            MPG = (Miles_Driven * 1.0) / Gallons_Used;
            System.out.println("The Mileage Per Hour is " + MPG + "mpg");
            count= Gallons_Used/ Miles_Driven;
            // PETROL
            total +=MPG;
            avg=total/count;
            System.out.println("The average mpg is "+avg);
        }
    }
}