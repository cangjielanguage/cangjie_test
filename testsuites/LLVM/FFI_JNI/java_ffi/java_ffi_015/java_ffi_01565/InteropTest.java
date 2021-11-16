package test;

public interface InteropTest {
    interface InnerInterface1<T> {
        default void defaultShow(T t) {
            System.out.println("InnerInterface1.defaultShow");
        }

        static <T> void staticShow(T t) {
            System.out.println("InnerInterface1.staticShow");
        }
    }

    interface InnerInterface2<T> {
        default void defaultShow(T t) {
            System.out.println("InnerInterface2.defaultShow");
        }

        static <T> void staticShow(T t) {
            System.out.println("InnerInterface2.staticShow");
        }
    }

    interface InnerInterface3<T> {
        default void defaultShow(T t) {
            System.out.println("InnerInterface3.defaultShow");
        }

        static <T> void staticShow(T t) {
            System.out.println("InnerInterface3.staticShow");
        }
    }
}
