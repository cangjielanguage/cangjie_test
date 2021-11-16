import java.lang.annotation.Annotation;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import test.*;

public class Main {
    public static void main(String[] args) throws Exception {
        Class clz = Class.forName("default.Test");
        Field field = clz.getField("num1");
        InteropTest annotation1 = field.getAnnotation(test.InteropTest.class);
        Constructor constructor1 = clz.getConstructor();
        Annotation annotation2 = constructor1.getAnnotation(test.InteropTest.class);
        Method method1 = clz.getMethod("test");
        InteropTest annotation3 = method1.getAnnotation(test.InteropTest.class);
        PrintAnnotation(annotation1);
        PrintAnnotation((InteropTest) annotation2);
        PrintAnnotation(annotation3);
    }

    static void PrintAnnotation(InteropTest anno) {
        if (anno == null) {
            System.out.println(anno);
            return;
        }
        System.out.println("@" + anno.annotationType().getCanonicalName() + "(name=" + anno.name() + ", num=" + anno.num() + ")");
    }
}