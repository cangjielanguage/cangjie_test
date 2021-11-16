import java.lang.annotation.Annotation;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import test.*;

public class Main {
    public static void main(String[] args) throws Exception {
        Class clz = Class.forName("default.Test");
        Field field1 = clz.getField("RED");
        InteropTest annotation1 = field1.getAnnotation(test.InteropTest.class);
        Field field2 = clz.getField("GREEN");
        InteropTest annotation2 = field2.getAnnotation(test.InteropTest.class);
        Field field3 = clz.getField("BLUE");
        InteropTest annotation3 = field3.getAnnotation(test.InteropTest.class);
        Constructor constructor = clz.getConstructor(String.class, int.class);
        Annotation annotation4 = constructor.getAnnotation(test.InteropTest.class);
        Method method = clz.getMethod("test");
        InteropTest annotation5 = method.getAnnotation(test.InteropTest.class);
        System.out.print("field1: ");
        PrintAnnotation(annotation1);
        System.out.print("field2: ");
        PrintAnnotation(annotation2);
        System.out.print("field3: ");
        PrintAnnotation(annotation3);
        System.out.print("init: ");
        PrintAnnotation((InteropTest) annotation4);
        System.out.print("method: ");
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