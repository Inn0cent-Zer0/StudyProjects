import java.io.*;
import java.net.*;
import java.util.*;
public class DateClient {
    public static void main(String[]args) throws IOException
    {
        /*
        * This program is a DateClient that connects to a server and requests the current date and time.
        *  The program takes the server IP address as a command line argument.
        * The program then creates a socket using the server IP address and port number 59090.
        * It then creates a Scanner object using the socket's input stream.
        * Finally, it prints out the server's response.*/
        if(args.length!=1)
        {
            System.err.println(" Enter the server IP as a sole command..");
            return;
        }
        var Socket= new Socket(args[0],59090);
        var in = new Scanner (Socket.getInputStream());
        System.out.println("Server Response :"+in.nextLine());
        System.out.println("--------------------------------------------");
    }
}