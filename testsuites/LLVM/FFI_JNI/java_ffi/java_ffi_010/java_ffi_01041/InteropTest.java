package test;

public class InteropTest<T> {
    public T[] array;

    public T[] getArray() {
        return array;
    }

    public void test(T[] myList) {
        System.out.println("myList[0] = " + myList[0]);
        System.out.println("myList[1] = " + myList[1]);
    }
}
