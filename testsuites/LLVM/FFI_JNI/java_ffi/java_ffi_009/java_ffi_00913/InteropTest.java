package test;

public class InteropTest {
    public Boolean field = null;
    public void test(boolean num) {
        num = field;
        System.out.println(num);
    }
}
