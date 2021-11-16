import java.lang.reflect.Method;

public class InteropTest {
    public static void main(String args[]) throws Exception {
        Class clz = Class.forName("default.CJClass");
        Method method = clz.getMethod("test");
        method.invoke(clz.newInstance());
    }
}
