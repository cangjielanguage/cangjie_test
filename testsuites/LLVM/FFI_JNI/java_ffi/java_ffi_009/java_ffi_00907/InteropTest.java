package test;

public class InteropTest {
    public Short field = null;
    public void test(short num) {
        num = field;
        System.out.println(num);
    }
}
