import java.io.*;
import java.util.Scanner;

// java program to assume the time taken to fill   water into the swimming  pool
public class swim {
    public static void main(String[]args) throws IOException
    {
        float Length,Width,Depth,Volume,Capacity,Time,Rate_of_flow = 0;
        String name;
       BufferedReader keyboard = new BufferedReader(new InputStreamReader(System.in));
       PrintWriter screen = new PrintWriter(System.out,true);
       Scanner scan= new Scanner(System.in);
        /* The approach of breaking a problem down into parts and
         further refining each part is known as stepwise refinement*/
        /* The expression of each statement of the algorithm in words
         and mathematical symbols is known as pseudocode*/
        // Get input from the user
        System.out.println("\n\t----------------///Time Taken to fill the Swimming pool with water///---------------");
        System.out.println("\t\tEnter the Length of The Swimming Pool  :");
        screen.flush();
        Length= scan.nextFloat();
        System.out.println("\t\tEnter the Width of The Swimming Pool  :");
        screen.flush();
        Width= scan.nextFloat();
        System.out.println("\t\tEnter the Depth of The Swimming Pool  :");
        screen.flush();
        Depth= scan.nextFloat();
        System.out.println("\t\tEnter the Capacity of The Swimming Pool  :");
        screen.flush();
        Capacity= scan.nextFloat();
        System.out.println("\t\tEnter the Rate of flow  The Swimming Pool  :");
        screen.flush();
        Rate_of_flow = scan.nextFloat();
        // Calculate the volume of the pool
        Volume = Length * Width * Depth;
        //Calculate the time to fill the pool
        Capacity= Volume * Capacity;
        Time= Capacity/Rate_of_flow;
        System.out.println(" \n\t------------//Statistics of the Swimming Pool//-----------");
        System.out.println(" Volume of the Swimming Pool :"+Volume+"Cubic Feet");
        System.out.println(" Capacity of the Swimming Pool :"+Capacity+"Gallons");
         System.out.println(" Time taken to fill the Swimming Pool :"+Time+"Hours");

    }
}