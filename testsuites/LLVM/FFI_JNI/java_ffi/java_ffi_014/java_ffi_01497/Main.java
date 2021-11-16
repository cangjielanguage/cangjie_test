import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Parameter;
import test.*;

public class Main {
    public static void main(String[] args) throws Exception {
        Class clz = Class.forName("default.Test");
        Method method = clz.getMethod("test", char.class, String.class, Object.class);
        Parameter[] params = method.getParameters();
        for (Parameter param : params) {
            InteropTest annotation = param.getAnnotation(test.InteropTest.class);
            System.out.println(param);
            System.out.println(annotation);
        }
    }
}