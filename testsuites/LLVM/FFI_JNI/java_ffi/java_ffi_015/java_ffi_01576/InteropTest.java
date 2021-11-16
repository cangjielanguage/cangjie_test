package test;

public interface InteropTest {
    class InnerClass {
        public <T> void show1(T... args) {
            System.out.println(args.length);
        }

        public static <T> void show2(T... args) {
            System.out.println(args.length);
        }
    }
}
