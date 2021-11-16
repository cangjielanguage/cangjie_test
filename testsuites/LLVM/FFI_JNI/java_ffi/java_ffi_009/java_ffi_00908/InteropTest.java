package test;

public class InteropTest {
    public Integer field = null;
    public void test(int num) {
        num = field;
        System.out.println(num);
    }
}
