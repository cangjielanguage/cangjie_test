import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Parameter;
import test.*;

public class Main {
    public static void main(String[] args) throws Exception {
        Class clz = Class.forName("default.Test");
        Method method = clz.getMethod("test", boolean.class);
        Parameter[] params = method.getParameters();
        for (Parameter param : params) {
            InteropTest annotation = param.getAnnotation(test.InteropTest.class);
            System.out.println(param);
            PrintAnnotation(annotation);
        }
    }

    static void PrintAnnotation(InteropTest anno) {
        if (anno == null) {
            System.out.println(anno);
            return;
        }
        System.out.println("@" + anno.annotationType().getCanonicalName() + "(name=" + anno.name() + ", num=" + anno.num() + ")");
    }
}