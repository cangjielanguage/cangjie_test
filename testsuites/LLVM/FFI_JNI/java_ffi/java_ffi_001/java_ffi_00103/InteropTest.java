package test;

public class InteropTest {
    public Object testObject(Object input) {
        try {
            System.out.println(input.hashCode());
            System.out.println(input.equals(new Object()));
            return input;
        } catch(Exception e){
            return new Object();
        }
    }

    public boolean isJavaObject(Object input) {
        return input instanceof Object;
    }
}
