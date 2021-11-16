package test;

public class InteropTest {
    public Object testObject(Object input) {
        System.out.println(input.hashCode());
        return input;
    }

    public boolean isJavaObject(Object input) {
        return input instanceof Object;
    }
}
