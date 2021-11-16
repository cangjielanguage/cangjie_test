package test;

public class InteropTest {
    public static class InnerClass<T extends String> {
        public void show2(T t) {
            System.out.println(t);
        }
    }
}
