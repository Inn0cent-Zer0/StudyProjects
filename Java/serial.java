import java.io.FileOutputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.util.Scanner;

class Student implements Serializable {
    String Name, Street, Area, Place, Pincode;
    int Roll_num;

     Student(String Na, String St, String Ar, String Pl, String Pin, int Roll) {
        this.Area = Ar;
        this.Name = Na;
        this.Street = St;
        this.Place = Pl;
        this.Roll_num = Roll;
        this.Pincode = Pin;
    }
}

public class serial {
    public static void main(String[] args) {
        String name, street, area, place, pincode;
        int roll_number;
        Scanner scan = new Scanner(System.in);
        System.out.println("Enter Name");
        name = scan.nextLine();
        System.out.println("Enter Street");
        street = scan.nextLine();
        System.out.println("Enter Area");
        area = scan.nextLine();
        System.out.println("Enter place");
        place = scan.nextLine();
        System.out.println("Enter pincode");
        pincode = scan.nextLine();
        System.out.println("Enter Roll Number");
        roll_number = scan.nextInt();
        Student si = new Student(name, street, area, place, pincode, roll_number);
        try {
            FileOutputStream File = new FileOutputStream("Ram.txt");
            ObjectOutputStream Object = new ObjectOutputStream(File);
            Object.writeObject(si);
            Object.flush();
            Object.close();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}