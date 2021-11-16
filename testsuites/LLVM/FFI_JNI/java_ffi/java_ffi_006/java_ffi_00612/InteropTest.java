package test;

public interface InteropTest<T> {
    default public T get(T value) {
        T valuetmp = value;
        return valuetmp;
    }

    default public void test(T value) {
        T valuetmp = value;
        System.out.printf("%s", valuetmp);
    }
}
