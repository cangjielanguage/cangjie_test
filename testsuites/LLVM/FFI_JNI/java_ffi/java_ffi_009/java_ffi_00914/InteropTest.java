package test;

public class InteropTest {
    public InteropTest field = null;

    public static void test() {
        System.out.println("in java");
    }

    public void testfunc(InteropTest field) {
        field = this.field;
        field.test();
    }
}
