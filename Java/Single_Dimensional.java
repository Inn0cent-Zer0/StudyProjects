import java.util.Scanner;
public class Single_Dimensional {
    public static void main(String[]args)
    {
        int [] arr=new int[10];
        Scanner scan= new Scanner(System.in);
        System.out.println("Enter the elements for the array ");
        for(int i=0;i<10;i++)
        {
            arr[i]= scan.nextInt();
        }
        System.out.println("The length of the given array is "+arr.length);
        System.out.println("The given array is ");
        System.out.print("{");
        for(int i=0;i<10;i++)
        {
            System.out.print(arr[i]);
            System.out.print(",");
        }
        System.out.print("}");
    }
}