package test;

public class InteropTest {
    public short[] array = {1, 2, 3, 4, 5};

    public short[] getArray() {
        return array;
    }

    public void test(short[] myList) {
        short sum = 0;
        for (int i = 0; i < myList.length; i++) {
            sum += myList[i];
        }
        System.out.println("sum = " + sum);
    }
}
