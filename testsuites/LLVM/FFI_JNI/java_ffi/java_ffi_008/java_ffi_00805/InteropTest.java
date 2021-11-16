package test;

public class InteropTest {
    public void test(Color color) {
        System.out.println(color.name());
        System.out.println(color.toString());
        System.out.println(color.ordinal());
        System.out.println(color.equals(Color.GREEN));
        System.out.println(color.compareTo(Color.GREEN));
    }
}

