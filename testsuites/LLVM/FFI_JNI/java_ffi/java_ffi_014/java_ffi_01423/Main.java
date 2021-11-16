import java.lang.annotation.Annotation;
import java.lang.reflect.Constructor;
import test.*;

public class Main {
    public static void main(String[] args) throws Exception {
        Class clz = Class.forName("default.Test");
        Constructor constructor = clz.getConstructor(long.class, float.class);
        Annotation annotation = constructor.getAnnotation(test.InteropTest.class);
        PrintAnnotation((InteropTest) annotation);
    }

    static void PrintAnnotation(InteropTest anno) {
        if (anno == null) {
            System.out.println(anno);
            return;
        }
        System.out.println("@" + anno.annotationType().getCanonicalName() + "(name=" + anno.name() + ", num=" + anno.num() + ")");
    }
}