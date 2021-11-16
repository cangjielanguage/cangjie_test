package test;

public class InteropTest {
    public void test(short... args) {
        for(short arg : args) {
            System.out.print(arg);
        }
    }
}
