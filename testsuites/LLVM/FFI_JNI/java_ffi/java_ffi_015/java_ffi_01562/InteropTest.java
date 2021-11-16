package test;

public interface InteropTest {
    int num1 = 1;
    interface InnerInterface1 {
        int num2 = 10;
        default int defaultFunc() {
            return num2 + 1;
        }

        static int staticFunc() {
            return num2 + 2;
        }
    }

    interface InnerInterface2 {
        int num3 = 100;
        default int defaultFunc() {
            return num3 + 1;
        }

        static int staticFunc() {
            return num3 + 2;
        }
    }

    interface InnerInterface3 {
        int num4 = 1000;
        default int defaultFunc() {
            return num4 + 1;
        }

        static int staticFunc() {
            return num4 + 2;
        }
    }
}
