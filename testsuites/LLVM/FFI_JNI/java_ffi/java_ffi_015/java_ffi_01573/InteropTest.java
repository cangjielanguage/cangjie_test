package test;

public interface InteropTest {
    int num1 = 1;
    class InnerClass {
        public int num2 = 10;
        public static int staticNum1 = 10;
        public int defaultFunc1() {
            return num2 + 1;
        }

        public static int staticFunc1() {
            return staticNum1 + 2;
        }

        public <T> void defaultShow1(T t) {
            System.out.println(t);
        }

        public static <T> void staticShow1(T t) {
            System.out.println(t);
        }
    }
}
