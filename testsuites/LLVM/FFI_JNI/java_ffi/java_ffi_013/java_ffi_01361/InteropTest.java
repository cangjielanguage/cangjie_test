import java.lang.reflect.Method;

public class InteropTest {
    public static void main(String[] args) {
        try {
            Class cls = Class.forName("default.Test");
            Method method = cls.getMethod("test5", int.class);
            method.invoke(cls.newInstance(), 0);
        } catch(Exception e) {
            System.out.println("catch success");
            e.printStackTrace();
        }
    }
}
