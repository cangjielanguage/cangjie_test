package test;

public interface InteropTest {
    int num1 = 1;
    interface InnerInterface {
        int num2 = 1;

        int test();

        default int defaultFunc() {
            return num2 + 1;
        }

        default <T> void defaultShow(T t) {
            System.out.println("defaultShow: " + t);
        }

        static int staticFunc() {
            return num2 + 2;
        }

        static <T> void staticShow(T t) {
            System.out.println("staticShow: " + t);
        }
    }
}
