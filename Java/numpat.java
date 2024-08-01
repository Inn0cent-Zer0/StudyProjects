import java.util.*;
public class numpat {
    public static void main(String[]args){
        int i,j,range;
        Scanner scan= new Scanner(System.in);
        System.out.println("\n\t\t+_+_+_+_+_+_+||Number Pyramid Pattern||+_+_+_+_+_+_+_+");
        System.out.println("\n\t\tEnter the Range Value:");
        range = scan.nextInt();
        for(i=1;i<=range;i++)
        {
            for(j=1;j<=range-1;j++)
            {
                System.out.print("  ");
            }
            for(j=i;j>=1;j--)
            {
                System.out.print(j+" ");
            }
            for(j=2;j<=i;j++)
            {
                System.out.print(j+" ");
            }
            System.out.println();
        }
    }
}