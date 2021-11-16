import java.lang.annotation.Annotation;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import test.*;

public class Main {
    public static void main(String[] args) throws Exception {
        Class clz1 = Class.forName("default.Test1");
        Class clz2 = Class.forName("default.Test2");
        Class clz3 = Class.forName("default.Test3");
        Field field = clz1.getField("num1");
        InteropTest annotation1 = field.getAnnotation(test.InteropTest.class);
        Constructor constructor = clz2.getConstructor();
        Annotation annotation2 = constructor.getAnnotation(test.InteropTest.class);
        Method method = clz3.getMethod("test");
        InteropTest annotation3 = method.getAnnotation(test.InteropTest.class);
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