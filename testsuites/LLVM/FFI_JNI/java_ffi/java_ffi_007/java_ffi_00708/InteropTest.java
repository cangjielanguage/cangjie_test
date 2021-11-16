package test;

public class InteropTest {
    public String getStr() {
        String str = "in java";
        System.out.println("in java str charAt(1): " + str.charAt(1));
        return str;
    }

    public void test(String str) {
        System.out.println(str);
    }
}
