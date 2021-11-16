package test;

public class InteropTest {
    public Double field = null;
    public void test(double num) {
        num = field;
        System.out.println(num);
    }
}
