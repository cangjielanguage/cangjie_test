package test;

public interface InteropTest {
    int num1 = 1;
    interface InnerInterface {
        int num2 = 1;

        int func();

        default int defaultFunc() {
            return num2 + 1;
        }

        static int staticFunc() {
            return num2 + 2;
        }
    }
}
