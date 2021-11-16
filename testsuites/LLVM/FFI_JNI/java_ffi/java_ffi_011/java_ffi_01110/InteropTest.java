package test;

public class InteropTest {
    public void test(byte[]... args) {
        for(byte[] arg : args) {
            for (byte a: arg) {
                System.out.print(a);
            }
        }
    }
}
