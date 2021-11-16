package test;

public interface InteropTest {
    default void test(byte... args) {
        for(byte arg : args) {
            System.out.print(arg);
        }
    }
}
