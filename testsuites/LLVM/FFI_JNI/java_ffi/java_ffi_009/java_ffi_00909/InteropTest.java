package test;

public class InteropTest {
    public Long field = null;
    public void test(long num) {
        num = field;
        System.out.println(num);
    }
}
