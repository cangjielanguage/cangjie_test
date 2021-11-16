package test;

public class InteropTest {
    public native void sayHello();

    static {
        System.loadLibrary("hello");
    }
}
