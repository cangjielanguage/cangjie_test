package test;

public interface InteropTest {
    default void test(long[]... args) {
        for(long[] arg : args) {
            for (long a : arg) {
                System.out.print(a);
            }
        }
    }
}
