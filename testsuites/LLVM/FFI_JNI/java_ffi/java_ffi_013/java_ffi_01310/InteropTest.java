package test;

public class InteropTest {
    public static void test() throws TestException {
        throw new TestException("throw in java");
    }
}
