import java.lang.reflect.Method;

public class InteropTest {
    public static void main(String args[]) throws Throwable{
        Class clz = Class.forName("default.CJClass");
        try{
                Error clz_t = (Error) clz.newInstance();
                throw clz_t;
           } catch (Error thr) {
                thr.printStackTrace();
           }
    }
}
