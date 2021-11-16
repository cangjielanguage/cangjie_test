package test;

public class InteropTest {
    public void test(A[] myList) {
        int sum = 0;
        for (int i = 0; i < myList.length; i++) {
            sum += myList[i].num;
        }
        System.out.println(sum);
    }
}
