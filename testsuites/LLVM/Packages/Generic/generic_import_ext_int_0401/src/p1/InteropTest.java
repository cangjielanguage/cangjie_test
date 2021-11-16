package p1;

public class InteropTest {
    public static class InnerClass {
        public int num = 1;
        public <T> void show(T t) {
            System.out.println(t);
        }
    }
}
