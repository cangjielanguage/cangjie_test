import java.lang.reflect.Method;

public class InteropTest {
    public static void main(String args[]) throws Exception {
        Class clz = Class.forName("default.CJClass1");
        Method method = clz.getMethod("test", int.class);
        Object object = method.invoke(clz.newInstance(), 0b1);
        Method method1 = clz.getMethod("test1", int.class);
        Object object1 = method1.invoke(clz.newInstance(), 0b10);
        System.out.println("in InteropTest: " + object);
        System.out.println("in InteropTest: " + object1);
    }
}
