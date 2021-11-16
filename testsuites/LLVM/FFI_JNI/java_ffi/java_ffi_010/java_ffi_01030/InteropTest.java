package test;

public class InteropTest {
    public int[] array = {1, 2, 3, 4, 5};

    public int[] getArray() {
        return array;
    }

    public void test(int[] myList) {
        int sum = 0;
        for (int i = 0; i < myList.length; i++) {
            sum += myList[i];
        }
        System.out.println("sum = " + sum);
    }
}
