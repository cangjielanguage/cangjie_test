package test;

public class InteropTest {
    public A[] array = {new A(100), new A(200)};

    public A[] getArray() {
        return array;
    }

    public void test(A[] myList) {
        int sum = 0;
        for (int i = 0; i < myList.length; i++) {
            sum += myList[i].num;
        }
        System.out.println("sum = " + sum);
    }
}
