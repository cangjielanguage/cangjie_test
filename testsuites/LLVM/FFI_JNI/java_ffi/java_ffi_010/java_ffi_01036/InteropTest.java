package test;

public class InteropTest {
    public long[][] array = {{1, 2, 3, 4, 5}, {1, 2, 3, 4, 5}, {1, 2, 3, 4, 5}};

    public long[][] getArray() {
        return array;
    }

    public void test(long[][] myList) {
        long sum = 0;
        for (int i = 0; i < myList.length; i++) {
            for (int j = 0; j < myList[0].length; j++) {
                sum += myList[i][j];
            }
        }
        System.out.println("sum = " + sum);
    }
}
