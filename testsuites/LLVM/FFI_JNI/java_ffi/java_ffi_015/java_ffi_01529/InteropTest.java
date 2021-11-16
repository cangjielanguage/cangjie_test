package test;

public interface InteropTest {
    int num1 = 1;
    InnerClass cls = new InnerClass();
    interface InnerInterface {
        int num2 = 1;

        int test();

        default int defaultFunc() {
            return num2 + 1;
        }

        static int staticFunc() {
            return num2 + 2;
        }
    }

    class InnerClass implements InnerInterface {
        public int test() {
            return num2 + 3;
        }
    }
}
