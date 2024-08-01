import java.util.Scanner;

public class First {
    public static void main(String[] args) {
        String s, a;
        Scanner scanner = new Scanner(System.in);
        System.out.println("\t\t\t\t=/=/==/=/=/=/=/=/=/=String=/==/=/==/=/==/=/==/=/=/==/=/=/=/=/=/=");
        System.out.println("Enter the string value");
        s = scanner.nextLine();
        System.out.println("Enter the letter to be found in the string");
        a = scanner.nextLine();
        System.out.println("\t\t\t\t=/=/==/=/=/=/=/=/=/=String=/==/=/==/=/==/=/==/=/=/==/=/=/=/=/=/=");
        System.out.println("the given string                        is      " + s);
        System.out.println("The Upper case of the given string      is      " + s.toUpperCase());
        System.out.println("The Lower case of the given string      is      " + s.toLowerCase());
        System.out.println("The Index           " + a + "           is      " + s.indexOf(a));
        System.out.println("The Lenght of the given string           is     " + s.length());
    }
}