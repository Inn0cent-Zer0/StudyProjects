import java.util.Scanner;
public class user_authenication {
     public static void main(String[]args){
         String username,password;
         Scanner scan = new Scanner(System.in);
         System.out.println("\n\t\t+_+_+_+_+_+_+||User Authencation||+_+_+_+_+_+_+");
         System.out.println("\n\t\tEnter The UserName :");
         username = scan.nextLine();
         System.out.println("\n\t\tEnter The Password :");
         password = scan.nextLine();
         if(username.equals("user@email.com")&&password.equals("password@123"))
         {
             System.out.println("\n\t\tAuthencation Successfull!...");
         }
         else
         {
             System.out.println("\n\t\tAuthencation Failed!...");
         }
     }
}