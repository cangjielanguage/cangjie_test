package test;

public class InteropTest<T> {
    public T num;

    public void test(T value) {
        T valuetmp = value;
        System.out.printf("%s", valuetmp);
        System.out.printf("%s", num);
    }
}
