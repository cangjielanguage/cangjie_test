package test;

public class InteropTest {
    public void test(double... args) {
        for(double arg : args) {
            System.out.print(arg);
        }
    }
}
