package test;

public class InteropTest {
    public String getStr() {
        String str = "in java";
        System.out.println("in java str isEmpty: " + str.isEmpty());
        return str;
    }

    public void test(String str) {
        System.out.println(str);
    }
}
