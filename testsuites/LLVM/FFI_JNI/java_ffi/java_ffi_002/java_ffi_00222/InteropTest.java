package test;

public class InteropTest {
    private int num = 1;

    public int getNum() {
        return num;
    }

    public synchronized void test(int n) {
        num += n;
    }
}
