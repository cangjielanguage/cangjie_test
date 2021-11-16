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
        Constructor constructor = clz.getConstructor();
        Annotation annotation2 = constructor.getAnnotation(test.InteropTest.class);
        Method method = clz.getMethod("test");
        InteropTest annotation3 = method.getAnnotation(test.InteropTest.class);
        System.out.println(annotation1);
        System.out.println(annotation2);
        System.out.println(annotation3);
    }
}