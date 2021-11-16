package test;

public interface InteropTest<T> {
    default public T get(T value) {
        System.out.println("in java");
        return value;
    }

    default public void test(T value) {
        T valuetmp = value;
        System.out.printf("%s", valuetmp);
    }
}
