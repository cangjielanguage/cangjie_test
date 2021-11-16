package test;

public class InteropTest {
    public void test1() throws TestException {
        throw new TestException("throw in java");
    }

    public void test2() throws TestException {
        test1();
    }

    public void test3() throws TestException {
        test2();
    }

    public void test4() throws TestException {
        test3();
    }

    public void test5() throws TestException {
        test4();
    }

    public void test6() throws TestException {
        test5();
    }
}
