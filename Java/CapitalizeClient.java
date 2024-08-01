import java.io.*;
import java.net.Socket;
import java.util.*;

public class CapitalizeClient {
    public static void main(String[] args) throws Exception {
        if (args.length != 1) {
            System.out.println("Enter the Server IP address as a Whole Command");
            return;
        }
        try (var socket = new Socket(args[0], 59898)) {
            System.out.println("Enter lines of text then Ctrl+D or Ctrl+C to quit");
            var scanner = new Scanner(System.in);
            var in = new Scanner(socket.getInputStream());
            var out = new PrintWriter(socket.getOutputStream(), true);
            System.out.println("Server Response :" + in.nextLine());
            while (scanner.hasNextLine()) {
                out.println(scanner.nextLine());
                System.out.println(in.nextLine());
            }
            System.out.println("--------------------------------------------");
        }
    }
}