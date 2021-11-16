package test;

public interface InteropTest {
    default void test(int num1, int num2, int... args) {
        if (num1 < num2) {
            for(int arg : args) {
                System.out.print(arg);
            }
        } else {
            System.out.print("ERROR");
        }
    }
}
