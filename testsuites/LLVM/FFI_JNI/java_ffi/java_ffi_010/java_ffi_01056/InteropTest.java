package test;

public class InteropTest {
    public int[][] array = {{1, 2}, {1, 2}};
    public int[][] test(int[][] myList) {
        int sum = 0;
        for (int i = 0; i < myList.length; i++) {
            for (int j = 0; j < myList[0].length; j++) {
                sum += myList[i][j];
            }
        }
        System.out.println("sum = " + sum);
        return myList;
    }
}
