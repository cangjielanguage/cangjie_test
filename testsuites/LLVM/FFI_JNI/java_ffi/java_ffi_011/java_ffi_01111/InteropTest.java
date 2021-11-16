package test;

public class InteropTest {
    public void test(A... args) {
        for(A arg : args) {
            System.out.print(arg.num);
        }
    }
}
