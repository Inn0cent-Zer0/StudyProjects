import java.util.*;
public class selectionsort {
    public static void main(String[]args)
    {
        int i,j,N,r,pos,temp;
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
        for(i=0;i<N-1;i++){
            pos = i;
            for(j=i+1;j<N;j++){
                if(array[j]<array[pos])
                {
                    pos =j;
                }
            }
            temp = array[i];
            array[i]= array[pos];
            array[pos]=temp;
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