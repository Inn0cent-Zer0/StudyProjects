import java.util.*;
import java.text.*;
public class Time {
    public static void main(String[]args)
    {
        Calendar calendar= Calendar.getInstance();
        System.out.println("\t=/=/==/=/=/=/=/=/=/=Date=/==/=/==/=/==/=/==/=/=/==/=/=/=/=/=/=");
        SimpleDateFormat simpleDateFormat= new SimpleDateFormat("dd/MM/yyyy ");
        Format format = new SimpleDateFormat("EEEE");
        String string= format.format(new Date());
        System.out.println("Date Today        =     "+simpleDateFormat.format(calendar.getTime()));
        System.out.println("Day Today         =     "+string);
    }
}