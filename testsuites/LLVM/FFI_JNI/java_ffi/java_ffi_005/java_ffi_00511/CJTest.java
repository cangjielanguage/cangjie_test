import java.lang.reflect.Method;

public class CJTest {
    public static void main(String args[]) throws Exception {
        Class clz = Class.forName("default.CJClass");
        Method method = clz.getMethod("test");
        Object object = method.invoke(clz.newInstance());
        System.out.println("in InteropTest: " + object);
    }
}
