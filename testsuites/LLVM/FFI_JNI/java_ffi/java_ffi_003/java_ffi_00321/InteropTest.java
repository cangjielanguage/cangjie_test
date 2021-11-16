import java.lang.reflect.Method;
import java.lang.reflect.Field;

public class InteropTest {
    public static void main(String args[]) throws Exception {
        Class clz = Class.forName("default.CJClass");
        Field field = clz.getDeclaredField("num");
        field.setAccessible(true);
        System.out.println("filed: " + field.get(clz.newInstance()));
        Method method = clz.getDeclaredMethod("test");
        method.setAccessible(true);
        method.invoke(clz.newInstance());
    }
}
