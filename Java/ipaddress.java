import java.net.InetAddress;
public class ipaddress {
    public static void main(String[]args) throws Exception
    {
        InetAddress IP = InetAddress.getLocalHost();
        System.out.println("\n\t\t\t\t+_+_+_+_+_+_+||IP Address ||_+_+_+_+_+_+_+");
        System.out.print("\n\t The IP(Interent Protocol) Address of this System is  : "+IP.getHostAddress());
        System.out.print("\n\t ---------------------------------------------------------------------\n");
        IP= InetAddress.getByName("www.dagdushethganpati.com");
        System.out.print("\n\tThe IP(Interent Protocol) Address of Dagsusheth Ganpathi Temple  is : "+IP);
        System.out.print("\n\t -------------------------------------------------------------------------------------------------------------\n");
        IP= InetAddress.getByName("www.facebook.com");
        System.out.print("\n\tThe IP(Interent Protocol) Address of Facebook  is : "+IP);
        System.out.print("\n\t --------------------------------------------------------------------------------\n");
        InetAddress[] Ip = InetAddress.getAllByName("www.google.com");
        System.out.print("\n\t The IP(Interent Protocol) Address of Google  is  :   ");

        for (int i=0; i< Ip.length; i++) {
            System.out.print(Ip[i] + " ");
        }
        System.out.print("\n\t -----------------------------------------------------------------------------------\n");
    }

}