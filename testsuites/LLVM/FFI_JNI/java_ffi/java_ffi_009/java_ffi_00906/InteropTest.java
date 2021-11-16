package test;

public class InteropTest {
    public Byte field = null;
    public void test(byte num) {
        num = field;
        System.out.println(num);
    }
}
