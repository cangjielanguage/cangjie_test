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

    public void printInt32(int num) {
        System.out.println(num);
    }

    public boolean isJavaObject(Object input) {
        printInt32(input.hashCode());
        return input instanceof Object;
    }
}
