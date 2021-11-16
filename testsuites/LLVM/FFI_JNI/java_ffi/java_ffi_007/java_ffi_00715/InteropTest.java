package test;

public class InteropTest {
    public String str = "in java";

    public String getStr() {
        return str;
    }

    public void test(InteropTest interoptest) {
        System.out.println(interoptest.getStr());
    }
}
