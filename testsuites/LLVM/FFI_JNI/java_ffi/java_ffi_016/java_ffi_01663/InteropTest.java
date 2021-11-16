package test;

public class InteropTest {
    public static class InnerClass<T extends String> {
        public <T> void show(T[] args1) {
            System.out.println(args1.length);
        }

        public void show(T t) {
            System.out.println(t);
        }
    }
}
