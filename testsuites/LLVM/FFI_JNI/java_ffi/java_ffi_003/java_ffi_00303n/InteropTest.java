import java.lang.reflect.Method;

public class InteropTest {
    public static void main(String args[]) throws Exception {
        Class clz = Class.forName("default.CJClass");
        Method method = clz.getMethod("test", int.class);
        Object object = method.invoke(clz.newInstance(), 0x1);
        System.out.println("in InteropTest: " + object);
    }
}
