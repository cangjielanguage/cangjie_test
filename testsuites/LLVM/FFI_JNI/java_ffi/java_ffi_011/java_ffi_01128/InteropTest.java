package test;

public interface InteropTest {
    default void test(float... args) {
        for(float arg : args) {
            System.out.print(arg);
        }
    }
}
