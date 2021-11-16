package test;

public class InteropTest {
    public <T> void test(int num1, int num2, T... args) {
        if (num1 < num2) {
            for(T arg : args) {
                System.out.print(arg);
            }
        } else {
            System.out.print("ERROR");
        }
    }
}
