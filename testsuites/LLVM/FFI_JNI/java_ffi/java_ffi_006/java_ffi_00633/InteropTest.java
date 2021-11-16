package test;

public class InteropTest {
    public <T> T get(T value) {
        return value;
    }
    public <T> void test(T value) {
        T valuetmp = value;
        System.out.printf("%s", valuetmp);
    }
}
