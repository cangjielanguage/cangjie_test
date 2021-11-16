package test;

public class InteropTest {
    public <T> T get(T value) {
        System.out.println("in java");
        return value;
    }

    public void test(Integer value) {
        System.out.printf("%s", value);
    }
}
