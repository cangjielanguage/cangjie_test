package test;

public interface InteropTest {
    int num1 = 1;
    interface InnerInterface {
        int num2 = 1;

        int test();

        default int defaultFunc() {
            return num2 + 1;
        }

        static int staticFunc() {
            return num2 + 2;
        }

        default <T> void show(T... args) {
            System.out.println(args.length);
        }
    }
}
