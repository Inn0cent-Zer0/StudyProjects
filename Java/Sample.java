public class Sample {
    public static void main(String[]args)
    {
        int total=0,y,x=1;
       while(x<=10)
       {
           y=x*x;
           System.out.println(y);
           total+=y;
           ++x;
       }
       System.out.println("The total is "+total);
    }
}