package test;

public class InteropTest {
    public Character field = null;
    public void test(char num) {
        num = field;
        System.out.println(num);
    }
}
