import java.lang.reflect.Method;
import java.lang.reflect.Field;

public class InteropTest {
    public static void main(String args[]) throws Exception {
        Class clz = Class.forName("default.Child");
        Field field = clz.getField("num");
        System.out.println("filed: " + field.get(clz.newInstance()));
        Method method = clz.getMethod("test");
        method.invoke(clz.newInstance());
    }
}
