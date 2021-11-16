package test;

public interface InteropTest {
    default void test(long... args) {
        for(long arg : args) {
            System.out.print(arg);
        }
    }
}
