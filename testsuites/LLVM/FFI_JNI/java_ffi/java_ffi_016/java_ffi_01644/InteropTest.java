package test;

public class InteropTest {
    public static class InnerClass {
        public int num = 1;
        public static int staticNum = 10;
        public final int finalNum = 100;
        public static final int staticFinalNum = 1000;

        public <T> void show(T... args) {
            System.out.println("in java");
        }

        public int test() {
            return num + staticNum + finalNum + staticFinalNum;
        }

        public static int staticFunc() {
            return staticNum + staticFinalNum;
        }
    }
}
