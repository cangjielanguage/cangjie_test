package test;

public interface InteropTest {
    default public <T> void test(T value) {
        System.out.printf("%s", value);
    }
}
