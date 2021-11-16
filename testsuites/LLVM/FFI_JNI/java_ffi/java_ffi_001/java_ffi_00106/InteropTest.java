package test;

public class InteropTest {
    public int printHashCode(Object input) {
        System.out.println(input.hashCode());
        return input.hashCode();
    }

    public boolean isJavaObject(Object input) {
        return input instanceof Object;
    }
}
