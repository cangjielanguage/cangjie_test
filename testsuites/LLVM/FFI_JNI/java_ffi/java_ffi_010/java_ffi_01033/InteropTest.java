package test;

public class InteropTest {
    public double[] array = {1.1, 2.1, 3.1, 4.1, 5.1};

    public double[] getArray() {
        return array;
    }

    public void test(double[] myList) {
        double sum = 0;
        for (int i = 0; i < myList.length; i++) {
            sum += myList[i];
        }
        System.out.println("sum = " + sum);
    }
}
