package test;

public class InteropTest {
    public <T> Object get(T value) {
        System.out.println("in java");
        return value;
    }

    public void test(Integer value) {
        System.out.printf("%s", value);
    }
}
