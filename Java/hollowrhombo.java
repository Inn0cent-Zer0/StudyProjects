import java.util.*;
public class hollowrhombo {
    public static void main(String[]args){
        int i,j,range;
        Scanner scan= new Scanner(System.in);
        System.out.println("\n\t\t+_+_+_+_+_+_+||Hollow Rhombus Star Pattern||+_+_+_+_+_+_+_+");
        System.out.println("\n\t\tEnter the Range Value:");
        range = scan.nextInt();

       //part one
        for(i=1;i<=range;i++)
        {
            for(j=1;j<=range-1;j++)
            {
                System.out.print(" ");
            }
            for(j=i;j<=2*i-1;j++)
            {
                System.out.print("*");
            }
            System.out.println();
        }
        // part two
        for(i=range;i>=1;i--)
        {
            for(j=1;j<=range-1;j++)
            {
                System.out.print(" ");
            }
            for(j=i;j<=2*i-1;j++)
            {
                System.out.print("*");
            }
            System.out.println();
        }
    }
}