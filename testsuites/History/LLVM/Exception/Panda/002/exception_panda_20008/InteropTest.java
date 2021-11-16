import java.lang.reflect.Method;

public class InteropTest {
    public static void main(String args[]) throws Throwable{
        Class clz = Class.forName("default.CJClass");
        try{
                RuntimeException clz_t = (RuntimeException) clz.newInstance();
                throw clz_t;
           } catch (RuntimeException thr) {
                thr.printStackTrace();
                System.out.println(thr.getMessage());
                System.out.println(thr.toString());
           }
    }
}
