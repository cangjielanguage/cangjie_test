package test;

public class InteropTest {
    public void test(int num1, int num2, byte... args) {
        if (num1 < num2) {
            for(byte arg : args) {
                System.out.print(arg);
            }
        } else {
            System.out.print("ERROR");
        }
    }
}
