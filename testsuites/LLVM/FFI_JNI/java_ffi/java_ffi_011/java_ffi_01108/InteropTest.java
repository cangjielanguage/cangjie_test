package test;

public class InteropTest {
    public void test(boolean... args) {
        for(boolean arg : args) {
            System.out.print(arg);
        }
    }
}
