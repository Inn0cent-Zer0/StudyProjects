import java.util.Scanner;

public class Wid {
    public static void main(String[] args) {
        double Double;
        String string;
        Scanner scanner = new Scanner(System.in);
        /*StringBuffer stringBuffer = new StringBuffer("String Buffer ");*/
        System.out.println("/=/=/=/=/=/=/=/=Constructor Overloaded/=/=/=/=/=/=/=/=/=/");
        System.out.println("Enter the string  Buffer value");
       /* Widgets w1 = new Widgets(stringBuffer);*/
        System.out.println("Enter the string value");
        string = scanner.nextLine();
        Widgets w2 = new Widgets(string);
        System.out.println("Enter the Double value");
        Double = scanner.nextDouble();
        Widgets w3 = new Widgets(Double);
        System.out.println("/=/=/=/=/=/=/=/=Constructor Overloaded/=/=/=/=/=/=/=/=/=/");
        /*System.out.println("The widget 1 value is " + w1);*/
        System.out.println("The widget 2 value is " + w2);
        System.out.println("The widget 3 value is " + w3);
    }
}