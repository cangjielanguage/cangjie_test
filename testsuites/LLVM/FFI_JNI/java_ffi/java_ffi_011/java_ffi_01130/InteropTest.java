package test;

public interface InteropTest {
    default void test(int... args) {
        for(int arg : args) {
            System.out.print(arg);
        }
    }
}
