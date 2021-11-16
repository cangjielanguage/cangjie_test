package test;

public class InteropTest {
    void exceptionInJava(){
        int[] a = {1,2,3};
        int b = 2;
        a[b-5] = 10;
    }
}
