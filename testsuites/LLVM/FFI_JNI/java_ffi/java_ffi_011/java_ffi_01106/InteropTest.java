package test;

public class InteropTest {
    public void test(float... args) {
        for(float arg : args) {
            System.out.print(arg);
        }
    }
}
