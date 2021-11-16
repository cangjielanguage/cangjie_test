package test;

public class InteropTest {
    public void testObject(Object input) {
        System.out.println(input.hashCode());
        System.out.println(input.equals(new Object()));
    }

    public boolean isJavaObject(Object input) {
        return input instanceof Object;
    }
}
