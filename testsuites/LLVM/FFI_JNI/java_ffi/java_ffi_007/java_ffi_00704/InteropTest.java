package test;

public interface InteropTest {
    default void test(String str) {
        System.out.println(str);
    }
}
