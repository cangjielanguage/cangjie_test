import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Parameter;
import test.*;

public class Main {
    public static void main(String[] args) throws Exception {
        Class clz = Class.forName("default.Test");
        Class clzChild = Class.forName("default.Child");
        Method method1 = clz.getMethod("test", char.class, String.class, Object.class);
        Parameter[] params1 = method1.getParameters();
        Method method2 = clzChild.getMethod("test", char.class, String.class, Object.class);
        Parameter[] params2 = method2.getParameters();
        for (Parameter param : params1) {
            InteropTest annotation = param.getAnnotation(test.InteropTest.class);
            System.out.println("Test: " + param);
            PrintAnnotation(annotation);
        }
        for (Parameter param : params2) {
            InteropTest annotation = param.getAnnotation(test.InteropTest.class);
            System.out.println("Child: " + param);
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