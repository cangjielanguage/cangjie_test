package test;

public class InteropTest implements Cloneable {
    @Override
    protected InteropTest clone() {
        InteropTest clone = null;
        try {
          clone = (InteropTest) super.clone();
        } catch (CloneNotSupportedException e) {
          throw new RuntimeException(e);
        }
        return clone;
    }

    public int printHashCode(Object input) {
        System.out.println(input.hashCode());
        return input.hashCode();
    }

    public boolean isJavaObject(Object input) {
        return input instanceof Object;
    }
}
