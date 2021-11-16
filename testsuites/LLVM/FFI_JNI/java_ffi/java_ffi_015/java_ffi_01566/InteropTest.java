package test;

public interface InteropTest {
    interface InnerInterface {
        default <T> void show1(T... args) {
            System.out.println(args.length);
        }

        static <T> void show2(T... args) {
            System.out.println(args.length);
        }
    }
}
