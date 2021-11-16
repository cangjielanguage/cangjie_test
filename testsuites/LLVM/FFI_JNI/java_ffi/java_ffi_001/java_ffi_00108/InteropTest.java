package test;

public class InteropTest {
    public void printInt32(int num) {
        System.out.println(num);
    }

    public boolean isJavaObject(Object input) {
        return input instanceof Object;
    }
}
