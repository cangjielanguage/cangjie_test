package test;

public interface InteropTest {
    int num1 = 1;
    interface InnerInterface<T, K> {
        default <T> boolean defaultFunc1(T t, K k) {
            if (t != null && k != null) {
                return true;
            }
            return false;
        }

        default boolean defaultFunc2(T t, K k) {
            if (t != null && k != null) {
                return false;
            }
            return true;
        }

        static <T, K> boolean staticFunc1(T t, K k) {
            if (t != null && k != null) {
                return true;
            }
            return false;
        }
    }
}
