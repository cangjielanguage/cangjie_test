package test;

public class InteropTest {
    public String[] array = null;
    public void test(String... args) {
        System.out.print(args);
    }

    public void test(String arg1, String... args) {
        System.out.print(arg1);
        System.out.print(args);
    }
}
