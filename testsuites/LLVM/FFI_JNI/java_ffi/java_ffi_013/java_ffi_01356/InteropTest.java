import java.lang.reflect.Method;

public class InteropTest {
    public static void main(String[] args) {
        try {
            Class cls = Class.forName("default.Test");
            Method method = cls.getMethod("test", Object.class);
            Object obj = null;
            method.invoke(cls.newInstance(), obj);
        } catch(Exception e) {
            System.out.println("catch success");
            e.printStackTrace();
        }
    }
}
