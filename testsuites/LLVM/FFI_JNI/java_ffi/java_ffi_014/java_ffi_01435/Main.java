import java.lang.annotation.Annotation;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import test.*;

public class Main {
    public static void main(String[] args) throws Exception {
        Class clz = Class.forName("default.Test");
        Class clzChild = Class.forName("default.Child");
        Field field1 = clz.getField("num1");
        InteropTest annotation1 = field1.getAnnotation(test.InteropTest.class);
        Field field2 = clzChild.getField("num1");
        InteropTest annotation2 = field2.getAnnotation(test.InteropTest.class);
        Constructor constructor = clz.getConstructor();
        Annotation annotation3 = constructor.getAnnotation(test.InteropTest.class);
        Method method1 = clz.getMethod("test");
        InteropTest annotation4 = method1.getAnnotation(test.InteropTest.class);
        Method method2 = clzChild.getMethod("test");
        InteropTest annotation5 = method2.getAnnotation(test.InteropTest.class);
        PrintAnnotation(annotation1);
        PrintAnnotation(annotation2);
        PrintAnnotation((InteropTest) annotation3);
        PrintAnnotation(annotation4);
        PrintAnnotation(annotation5);
    }

    static void PrintAnnotation(InteropTest anno) {
        if (anno == null) {
            System.out.println(anno);
            return;
        }
        System.out.println("@" + anno.annotationType().getCanonicalName() + "(name=" + anno.name() + ", num=" + anno.num() + ")");
    }
}