package test;

public interface InteropTest {
    int num1 = 1;
    class InnerClass {
        public int num2 = 1;
        public static int staticNum = 10;

        public <T> void show(T... args) {
            System.out.println(args.length);
        }

        public int test() {
            return num2 + 1;
        }

        public static int staticFunc() {
            return staticNum + 1;
        }
    }
}
