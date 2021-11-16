package test;

public class InteropTest {
    public void test(long[] myList) {
        myList = new long[2];
        myList[0] = -1;
        System.out.println("myList[0] = " + myList[0]);
        System.out.println("myList[1] = " + myList[1]);
    }
}
