package test;

public class InteropTest {
    public void test(int num) throws TestException1, TestException2, TestException3 {
        if (num < 0) {
            throw new TestException1("throw in java");
        } else if (num == 0) {
            throw new TestException2("throw in java");
        } else {
            throw new TestException3("throw in java");
        }
    }
}
