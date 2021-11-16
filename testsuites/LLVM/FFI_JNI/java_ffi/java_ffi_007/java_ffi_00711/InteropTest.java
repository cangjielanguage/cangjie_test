package test;

public class InteropTest {
    public String getStr() {
        String str = "in java";
        System.out.println("in java str codePointCount(0, 2): " + str.codePointCount(0, 2));
        return str;
    }

    public void test(String str) {
        System.out.println(str);
    }
}
