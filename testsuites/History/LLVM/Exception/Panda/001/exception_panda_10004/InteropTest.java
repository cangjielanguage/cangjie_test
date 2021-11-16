package test;

public class InteropTest {
    void exceptionInJava(){
        Object x[] = new String[3];
        x[0] = new Integer(0);
    }
}
