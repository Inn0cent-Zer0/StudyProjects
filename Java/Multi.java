import java.util.Scanner;

public class Multi {
    public static void main(String[] args) {
        int[][] arr = new int[3][3];
        Scanner scanner = new Scanner(System.in);
        System.out.println("Enter the array elements ");
        for (int i = 0; i < arr.length; i++) {
            for (int j = 0; j < arr[i].length; j++) {
                arr[i][j] = scanner.nextInt();
            }
        }
        for (int[] ints : arr) {
            for (int anInt : ints) {
                System.out.print(anInt +"  ");
            }
            System.out.println();

        }
    }
}

