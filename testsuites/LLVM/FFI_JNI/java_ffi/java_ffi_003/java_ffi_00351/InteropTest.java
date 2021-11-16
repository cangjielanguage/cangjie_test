import java.lang.reflect.Method;

public class InteropTest {
    public static void main(String args[]) throws Exception {
        Class clz1 = Class.forName("default.CJClass");
        Class clz2 = Class.forName("default.Child");
        Method method = clz1.getMethod("test", int.class);
        Object object = method.invoke(clz2.newInstance(), 0x1);
        System.out.println("in InteropTest: " + object);
    }
}
