package test;

public interface InteropTest {
    default void test(Color... args) {
        for(Color arg : args) {
            System.out.print(arg);
        }
    }
}
