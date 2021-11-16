import java.lang.reflect.Method;

public class InteropTest {
    public static void main(String[] args) {
        try {
            Class cls = Class.forName("default.Test");
            Method method = cls.getMethod("test", int.class);
            method.invoke(cls.newInstance(), -1);
        } catch(Exception e) {
            System.out.println("catch success1");
            e.printStackTrace();
        }
        try {
            Class cls = Class.forName("default.Test");
            Method method = cls.getMethod("test", int.class);
            method.invoke(cls.newInstance(), 0);
        } catch(Exception e) {
            System.out.println("catch success2");
            e.printStackTrace();
        }
        try {
            Class cls = Class.forName("default.Test");
            Method method = cls.getMethod("test", int.class);
            method.invoke(cls.newInstance(), 1);
        } catch(Exception e) {
            System.out.println("catch success3");
            e.printStackTrace();
        }
    }
}
