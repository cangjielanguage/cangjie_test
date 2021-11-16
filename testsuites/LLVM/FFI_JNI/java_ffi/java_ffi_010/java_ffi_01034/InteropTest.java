package test;

public class InteropTest {
    public boolean[] array = {true, false};

    public boolean[] getArray() {
        return array;
    }

    public void test(boolean[] myList) {
        System.out.println("myList[0] = " + myList[0]);
        System.out.println("myList[1] = " + myList[1]);
    }
}
