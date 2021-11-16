package test;

public class InteropTest {
    public static void test(int num1, int num2, String... args) {
        if (num1 < num2) {
            for(String arg : args) {
                System.out.print(arg);
            }
        } else {
            System.out.print("ERROR");
        }
    }
}
