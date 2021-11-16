package test;

public interface InteropTest {
    int num1 = 1;
    public class InnerClass<T, K> {
        public <T> boolean defaultFunc1(T t, K k) {
            if (t != null && k != null) {
                return true;
            }
            return false;
        }

        public boolean defaultFunc2(T t, K k) {
            if (t != null && k != null) {
                return false;
            }
            return true;
        }

        public static <T, K> boolean staticFunc1(T t, K k) {
            if (t != null && k != null) {
                return true;
            }
            return false;
        }
    }
}
