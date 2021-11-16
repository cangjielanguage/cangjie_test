package test;

public class InteropTest {
    public <T, K, V> void test(T value1, K value2, V value3) {
        T valuetmp1 = value1;
        K valuetmp2 = value2;
        V valuetmp3 = value3;
        System.out.printf("%s", valuetmp1);
        System.out.printf("%s", valuetmp2);
        System.out.printf("%s", valuetmp3);
    }
}
