package test;

public class InteropTest {
    public InteropTest field = null;
    public int num;

    public InteropTest(int num) {
        this.num = num;
    }
    public InteropTest test() {
        return field;
    }
}
