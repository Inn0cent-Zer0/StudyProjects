import java.io.Serializable;
public class Account implements Serializable {
    private int account;
    private String First_Name,Last_Name;
    private double Balance;
    public Account(int acct,String first,String last,double bal )
    {
        this(0,""," ",0.0);
    }

}