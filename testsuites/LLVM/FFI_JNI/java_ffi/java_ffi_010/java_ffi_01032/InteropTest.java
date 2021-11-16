package test;

public class InteropTest {
    public float[] array = {1.1f, 2.1f, 3.1f, 4.1f, 5.1f};

    public float[] getArray() {
        return array;
    }

    public void test(float[] myList) {
        float sum = 0.0f;
        for (int i = 0; i < myList.length; i++) {
            sum += myList[i];
        }
        System.out.println("sum = " + sum);
    }
}
