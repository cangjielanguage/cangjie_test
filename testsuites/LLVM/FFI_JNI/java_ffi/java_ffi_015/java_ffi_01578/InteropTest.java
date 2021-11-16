package test;

public interface InteropTest {
    int num1 = 1;
    abstract class InnerClass {
        public int num2 = 1;

        public abstract int test();

        public int defaultFunc() {
            return num2 + 1;
        }
    }
}
