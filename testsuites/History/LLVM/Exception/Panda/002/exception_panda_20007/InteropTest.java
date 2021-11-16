import java.lang.reflect.Method;

public class InteropTest {
    public static void main(String args[]) throws Throwable{
        Class clz = Class.forName("default.CJClass");
        try{
                Exception clz_t = (Exception) clz.newInstance();
                throw clz_t;
           } catch (Exception thr) {
                thr.printStackTrace();
           }
    }
}
