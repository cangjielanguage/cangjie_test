package test;

public class InteropTest<T> {
    public void test(T value) {
        T valuetmp = value;
        System.out.printf("%s", valuetmp);
    }
}
