package test;

public interface InteropTest<T> {
    default public <K> void test(T value1, K value2) {
        T valuetmp1 = value1;
        K valuetmp2 = value2;
        System.out.printf("%s", valuetmp1);
        System.out.printf("%s", valuetmp2);
    }
}
