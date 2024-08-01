import java.util.*;

public class sort {
    public static void main(String[]args)
    {
       int temp,i,j,N;
       Scanner scan= new Scanner(System.in);
       System.out.println("\n\t\t+_+_+_+_+_+_+||Bubble Sort ||_+_+_+_+_+_+_+");
       System.out.println("\n\t\tEnter the number of values to be entered :");
       int sc= scan.nextInt();
        System.out.println("\n\t\tEnter "+sc+"  Values :");
       int[] array = new int[sc];
       for(i=0;i<sc;i++)
       {
           array[i]= scan.nextInt();
       }
       N= array.length;
       for(i=0;i<N;i++){
           for(j=0;j<N-1;j++){
               if(array[j]>array[j+1])
               {
                   temp = array[j+1];
                   array[j+1]= array[j];
                   array[j]=temp;
               }
           }
       }

        System.out.println("\n\t\t Array After Sorting");
        System.out.print("{");
        for(i=1;i<N;i++)
       {
           System.out.print(array[i]+" ");
           System.out.print(",");
       }
        System.out.print("}");
    }
}