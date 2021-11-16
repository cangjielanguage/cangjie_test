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

        interface innerInterface {
            int num3 = 10;

            int test();

            default int defaultFunc() {
                return num3 + 1;
            }

            static int staticFunc() {
                return num3 + 2;
            }
        }

        class innerClass implements innerInterface {
            public static int staticNum = 20;
            public int num4 = 20;

            public int test() {
                return num4 + 1;
            }

            public static int staticFunc() {
                return staticNum + num3;
            }
        }
    }
}
