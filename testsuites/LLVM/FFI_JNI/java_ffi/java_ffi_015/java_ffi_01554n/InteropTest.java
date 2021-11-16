package test;

public interface InteropTest {
    int num1 = 1;
    abstract class InnerClass {
        public int num2 = 1;
        public static int staticNum = 10;

        public abstract int absFunc();

        public <T> void show(T t) {
            System.out.println("show: " + t);
        }

        public int test() {
            return num2 + 1;
        }

        public static int staticFunc() {
            return staticNum + 1;
        }
    }
}
