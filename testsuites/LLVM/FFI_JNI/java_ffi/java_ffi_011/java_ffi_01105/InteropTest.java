package test;

public class InteropTest {
    public void test(long... args) {
        for(long arg : args) {
            System.out.print(arg);
        }
    }
}
