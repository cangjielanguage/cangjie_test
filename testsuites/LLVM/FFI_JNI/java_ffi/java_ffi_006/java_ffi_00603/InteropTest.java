package test;

public class InteropTest<T> {
    public T num;

    public InteropTest(T value) {
        this.num = value;
    }

    public T get() {
        return num;
    }

    public void test(T value) {
        T valuetmp = value;
        System.out.printf("%s", valuetmp);
    }
}
