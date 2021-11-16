package test;

public interface InteropTest {
    int num1 = 1;
    abstract class InnerClass {
        public int num2 = 1;
        public static int staticNum1 = 10;

        public abstract int absFunc();

        public <T> void show(T t) {
            System.out.println("show: " + t);
        }

        public int test() {
            return num2 + 1;
        }

        public static int staticFunc() {
            return staticNum1 + 1;
        }

        public interface innerInterface {
            int num3 = 10;

            int test();

            default int defaultFunc() {
                return num3 + 1;
            }

            static int staticFunc() {
                return num3 + 2;
            }
        }

        public static class innerClass implements innerInterface {
            public static int staticNum2 = 20;
            public int num4 = 20;

            public int test() {
                return num4 + 1;
            }

            public static int staticFunc() {
                return staticNum2 + num3;
            }
        }
    }
}
