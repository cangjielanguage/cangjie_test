package test;

public class InteropTest {
    public <T> void test(T... args) {
        System.out.println(args.length);
    }
}
