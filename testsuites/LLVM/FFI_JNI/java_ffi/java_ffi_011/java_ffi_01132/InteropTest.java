package test;

public interface InteropTest {
    default void test(String... args) {
        for(String arg : args) {
            System.out.print(arg);
        }
    }
}
