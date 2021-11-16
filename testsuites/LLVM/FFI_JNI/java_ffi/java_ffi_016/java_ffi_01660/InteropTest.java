package test;

public class InteropTest {
    public static class InnerClass<T, M> {
        public T t;
        public M m;

        public InnerClass(T t, M m) {
            this.t = t;
            this.m = m;
        }

        public <T> void show(T[] args1, M[] args2) {
            System.out.println(args1.length);
            System.out.println(args2.length);
        }

        public void show(T t, M m) {
            System.out.println(t);
            System.out.println(m);
        }

        public static <T, M> void staticShow(T[] args1, M... args2) {
            System.out.println(args1.length);
            System.out.println(args2.length);
        }
    }
}
