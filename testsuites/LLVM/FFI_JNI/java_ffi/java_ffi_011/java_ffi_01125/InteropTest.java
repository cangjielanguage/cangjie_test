package test;

public class InteropTest {
    public void test(byte... args) {
        for(byte arg : args) {
            System.out.print(arg);
        }
    }

    public void test(byte arg1, byte... args) {
        for(byte arg : args) {
            System.out.print(arg);
        }
        System.out.print(arg1);
    }
}
