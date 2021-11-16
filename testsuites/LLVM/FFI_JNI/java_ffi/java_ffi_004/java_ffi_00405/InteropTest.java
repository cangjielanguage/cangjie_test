package test;

public interface InteropTest {
    void f(int i);

    default void test1() {
        System.out.println("in InteropTest test1");
    }

    default void test2() {
        System.out.println("in InteropTest test2");
    }
}
