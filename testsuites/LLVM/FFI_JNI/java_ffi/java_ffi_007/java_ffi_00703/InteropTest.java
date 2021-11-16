package test;

public class InteropTest {
    public String str;
    public InteropTest(String str) {
        this.str = str;
    }

    public String getStr() {
        return str + "\nin java";
    }

    public void test(String str) {
        System.out.println(str);
    }
}
