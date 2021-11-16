package test;

public interface InteropTest {
    interface InnerInterface1 {
        default <T> void defaultShow(T t) {
            System.out.println(t);
        }

        static <T> void staticShow(T t) {
            System.out.println(t);
        }
    }

    interface InnerInterface2 {
        default <T> void defaultShow(T t) {
            System.out.println(t);
        }

        static <T> void staticShow(T t) {
            System.out.println(t);
        }
    }

    interface InnerInterface3 {
        default <T> void defaultShow(T t) {
            System.out.println(t);
        }

        static <T> void staticShow(T t) {
            System.out.println(t);
        }
    }
}
