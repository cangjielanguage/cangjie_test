package test;

public class InteropTest {
    public static byte[] array = {1, 2, 3, 4, 5};

    public static byte[] getArray() {
        return array;
    }

    public static void test(byte[] myList) {
        byte sum = 0;
        for (int i = 0; i < myList.length; i++) {
            sum += myList[i];
        }
        System.out.println("sum = " + sum);
    }
}
