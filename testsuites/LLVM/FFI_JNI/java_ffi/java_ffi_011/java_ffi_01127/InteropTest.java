package test;

public interface InteropTest {
    default void test(short... args) {
        for(short arg : args) {
            System.out.print(arg);
        }
    }
}
