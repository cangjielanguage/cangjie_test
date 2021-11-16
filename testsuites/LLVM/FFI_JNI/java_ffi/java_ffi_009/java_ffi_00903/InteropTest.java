package test;

public class InteropTest {
    public InteropTest field = null;
    public int num = 0;

    public InteropTest(int num) {
        this.num = num;
    }
    public void test() {
        System.out.println(this.num);
    }
}
