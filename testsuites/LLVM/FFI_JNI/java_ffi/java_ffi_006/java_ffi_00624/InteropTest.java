package test;

public interface InteropTest<T extends Number & Comparable<T>> {
    default public void test(T value1, T value2) {
        if (value1.compareTo(value2) > 0) {
            System.out.printf("%s", value1);
        } else {
            System.out.printf("%s", value2);
        }
    }
}
