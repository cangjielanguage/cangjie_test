package test;

public interface InteropTest {
    public default byte[] getArray() {
        byte[] array = {1, 2, 3, 4, 5};
        return array;
    }

    public default void test(byte[] myList) {
        byte sum = 0;
        for (int i = 0; i < myList.length; i++) {
            sum += myList[i];
        }
        System.out.println("sum = " + sum);
    }
}
