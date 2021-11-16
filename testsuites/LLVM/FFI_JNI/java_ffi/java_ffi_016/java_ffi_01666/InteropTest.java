package test;

public class InteropTest {
    public static class InnerClass<T extends String> {
        public <T> void show1(T[] args1) {
            System.out.println(args1.length);
        }

        public void show2(T t) {
            System.out.println(t);
        }
    }
}
