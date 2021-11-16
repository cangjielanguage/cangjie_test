package test;

public class InteropTest {
    public void test(String... args) {
        for(String arg : args) {
            System.out.print(arg);
        }
    }
}
