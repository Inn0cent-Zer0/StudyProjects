public class Widgets {
    double w;
    Widgets(String string)
    {
        w= Double.valueOf(string).doubleValue();
    }
    /*Widgets(StringBuffer stringBuffer)
    {
        String str=stringBuffer.toString();
        w= Double.valueOf(str).doubleValue();
    }*/
    Widgets(double Double)
    {
        w=Double;
    }
}
