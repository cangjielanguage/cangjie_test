package test;

public interface InteropTest<T> {
    public T get(T value);

    default public void test(T value) {
        T valuetmp = value;
        System.out.printf("%s", valuetmp);
    }
}
