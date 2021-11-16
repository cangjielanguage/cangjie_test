package test;

public interface InteropTest<T> {
    default public void test(T value) {
        T valuetmp = value;
        System.out.printf("%s", valuetmp);
    }
}
