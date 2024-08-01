import java.io.*;
import java.net.*;
import java.util.*;
import java.util.concurrent.*;

public class CapitalizeServer {
    public static void main(String[] args) throws Exception {
        try (var listener = new ServerSocket(59898)) {
            System.out.println("Captialize Server is Running !....");
            var pool = Executors.newFixedThreadPool(20);
            while (true) {
                pool.execute(new Capitalizer(listener.accept()));
            }
        }
    }

    private static class Capitalizer implements Runnable {
        private Socket socket;

        Capitalizer(Socket socket) {
            this.socket = socket;
        }

        @Override
        public void run() {
            System.out.println("Connected :" + socket);
            try {
                var in = new Scanner(socket.getInputStream());
                var out = new PrintWriter(socket.getOutputStream());
                while (in.hasNextLine()) {
                    out.println(in.nextLine().toUpperCase());
                }
            } catch (Exception e) {
                System.out.println("Error" + socket);
            } finally {
                try {
                    socket.close();
                } catch (Exception e) {
                    System.out.println("Error" + socket);
                }
                System.out.println("Closed " + socket);
            }
        }
    }

}

