package test;

public class InteropTest {
    public void test1() {
        int a = 1 / 0;
    }

    public void test2() {
        test1();
    }

    public void test3() {
        test2();
    }

    public void test4() {
        test3();
    }

    public void test5() {
        test4();
    }

    public void test6() {
        test5();
    }
}
