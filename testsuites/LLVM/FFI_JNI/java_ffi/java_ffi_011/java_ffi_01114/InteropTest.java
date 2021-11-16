package test;

public abstract class InteropTest {
    public abstract void test1(int num1, int num2, String... args);
    public void test2(int num1, int num2, String... args) {
        if (num1 < num2) {
            for(String arg : args) {
                System.out.print(arg);
            }
        } else {
            System.out.print("ERROR");
        }
    }
}
