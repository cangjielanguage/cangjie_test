import java.lang.reflect.Method;

public class InteropTest {
    public static void main(String args[]) throws Exception {
        Class clz = Class.forName("default.CJClass");
        Method method = clz.getMethod("test", int.class);
        try{
                Object object = method.invoke(clz.newInstance(),0x01);
                System.out.println("in InteropTest: " + object);
            } catch (Error thr) {
                System.out.println("exception in cangjie");
            }
    }
}
