package test;

public interface InteropTest {
    default void test() {
        System.out.println("in InteropTest");
    }
}
