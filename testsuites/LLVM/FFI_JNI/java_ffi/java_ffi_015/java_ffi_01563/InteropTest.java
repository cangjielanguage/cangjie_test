package test;

public interface InteropTest {
    int num1 = 1;
    interface InnerInterface1 {
        int num2 = 10;
        default int defaultFunc1() {
            return num2 + 1;
        }

        static int staticFunc1() {
            return num2 + 2;
        }

        default <T> void defaultShow1(T t) {
            System.out.println(t);
        }

        static <T> void staticShow1(T t) {
            System.out.println(t);
        }
    }

    interface InnerInterface2 {
        int num3 = 100;
        default int defaultFunc2() {
            return num3 + 1;
        }

        static int staticFunc2() {
            return num3 + 2;
        }

        default <T> void defaultShow2(T t) {
            System.out.println(t);
        }

        static <T> void staticShow2(T t) {
            System.out.println(t);
        }
    }

    interface InnerInterface3 {
        int num4 = 1000;
        default int defaultFunc3() {
            return num4 + 1;
        }

        static int staticFunc3() {
            return num4 + 2;
        }

        default <T> void defaultShow3(T t) {
            System.out.println(t);
        }

        static <T> void staticShow3(T t) {
            System.out.println(t);
        }
    }
}
