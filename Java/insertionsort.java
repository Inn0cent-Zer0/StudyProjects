import java.util.*;
public class insertionsort {
    public static void main(String[]args)
    {
        int i,j,N,r,temp;
        Scanner scan= new Scanner(System.in);
        System.out.println("\n\t\tEnter the number of values to be entered :");
        r= scan.nextInt();
        System.out.println("\n\t\tEnter "+r+"  Values :");
        int[] array = new int[r];
        N= array.length;
        for(i=0;i<N;i++)
        {
            array[i]= scan.nextInt();
        }
        for(i=0;i<N;i++){
            j=i;
            temp= array[i];
              while(j>0 && temp<array[j-1])
              {
                  array[j]= array[j-1];
                  j = j-1;
              }
              array[j]=temp;
        }
        System.out.println("\n\t\t Array After Sorting");
        System.out.print("{");
        for(i=0;i<N;i++)
        {
            System.out.print(array[i]+" ");
            System.out.print(",");
        }
        System.out.print("}");
    }
}