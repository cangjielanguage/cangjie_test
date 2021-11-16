package test;

public interface InteropTest<T> {
    public Object get(T value);

    default public void test(T value) {
        T valuetmp = value;
        System.out.printf("%s", valuetmp);
    }
}
