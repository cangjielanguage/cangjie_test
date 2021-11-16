package test;

public interface InteropTest {
    int num1 = 1;
    interface InnerInterface {
        int num2 = 1;

        default int defaultFunc() {
            return num2 + 1;
        }

        default <T> void show(T... args) {
            System.out.println(args.length);
        }
    }
}
