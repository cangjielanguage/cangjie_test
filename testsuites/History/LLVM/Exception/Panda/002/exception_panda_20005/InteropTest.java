import java.lang.reflect.Method;

public class InteropTest {
    public static void main(String args[]) throws Throwable{
        Class clz = Class.forName("default.CJClass");
        try{
                Throwable clz_t = (Throwable) clz.newInstance();
                throw clz_t;
           } catch (Throwable thr) {
                thr.printStackTrace();
           }
    }
}
