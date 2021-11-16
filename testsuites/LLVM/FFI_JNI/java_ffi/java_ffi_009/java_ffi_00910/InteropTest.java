package test;

public class InteropTest {
    public Float field = null;
    public void test(float num) {
        num = field;
        System.out.println(num);
    }
}
