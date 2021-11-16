package test;

public class InteropTest {
    public void test(byte... args) {
        for(byte arg : args) {
            System.out.print(arg);
        }
    }

    public void test(byte arg1, byte arg2) {
        System.out.print(arg2);
        System.out.print(arg1);
    }
}
