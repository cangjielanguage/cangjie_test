package test;

public class InteropTest {
    public void test(byte... args) {
        for(byte arg : args) {
            System.out.print(arg);
        }
    }
}
