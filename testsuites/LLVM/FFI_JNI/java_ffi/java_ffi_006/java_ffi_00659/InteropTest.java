package test;

public class InteropTest<T> {
    public int num = 1;
    public static int staticNum = 2;

    public void test(T t) {
        System.out.println(t);
    }

    public static <M> void staticTest(M m) {
        System.out.println(m);
    }
}
