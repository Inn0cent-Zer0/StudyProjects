import java.io.FileOutputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
/*class Studentinfo implements Serializable
{
    String name;
    int rid;
    static String contact;
    Studentinfo(String n, int r, String c)
    {
        this.name = n;
        this.rid = r;
        this.contact = c;
    }
}*/

class Demo {
    public void main(String[] args) {
        try {
            Studentinfo si = new Studentinfo("Abhi", 104, "110044");
            FileOutputStream fos = new FileOutputStream("student.txt");
            ObjectOutputStream oos = new ObjectOutputStream(fos);
            oos.writeObject(si);
            oos.flush();
            oos.close();
        } catch (Exception e) {
        }
    }

    class Studentinfo implements Serializable {
        static String contact;
        String name;
        int rid;

        Studentinfo(String n, int r, String c) {
            this.name = n;
            this.rid = r;
            contact = c;
        }
    }

}
