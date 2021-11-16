package test;

public class InteropTest {
    public static <T> void test(T value) {
        T valuetmp = value;
        System.out.printf("%s", valuetmp);
    }
}
