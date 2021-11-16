package test;

public interface InteropTest {
    default void test(double... args) {
        for(double arg : args) {
            System.out.print(arg);
        }
    }
}
