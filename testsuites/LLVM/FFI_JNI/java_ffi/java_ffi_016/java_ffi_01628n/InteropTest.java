package test;

public class InteropTest {
    public int n1 = 1;
    public static int n2 = 2;

    public static class InnerClass extends Father {
        public int num = 1;
        public static int staticNum = 10;
        public final int finalNum = 100;
        public static final int staticFinalNum = 1000;

        public <T> void show(T t) {
            System.out.println(t);
        }

        public int test() {
            return num + staticNum + finalNum + staticFinalNum;
        }

        public static int staticFunc() {
            return staticNum + staticFinalNum;
        }
    }

    static class Father {
        public int fatherNum = 1;
        public static int fatherStaticNum = 1;
    }
}
