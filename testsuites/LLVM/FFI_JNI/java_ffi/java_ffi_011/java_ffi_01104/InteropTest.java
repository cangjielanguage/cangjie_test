package test;

public class InteropTest {
    public void test(int... args) {
        for(int arg : args) {
            System.out.print(arg);
        }
    }
}
