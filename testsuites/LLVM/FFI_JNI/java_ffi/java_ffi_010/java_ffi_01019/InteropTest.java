package test;

public class InteropTest {
    public void test(int[] myList) {
        int sum = 0;
        for (int i = 0; i < myList.length; i++) {
            sum += myList[i];
        }
        System.out.println("sum = " + sum);
    }
}
