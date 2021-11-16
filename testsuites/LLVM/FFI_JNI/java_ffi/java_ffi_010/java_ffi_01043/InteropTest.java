package test;

public class InteropTest {
    public String[] myList = {"in ", "java"};

    public void test(String[] myList) {
        String sum = "";
        for (int i = 0; i < myList.length; i++) {
            sum += myList[i];
        }
        System.out.println(sum);
    }
}
