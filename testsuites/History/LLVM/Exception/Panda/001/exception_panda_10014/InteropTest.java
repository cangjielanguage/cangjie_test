package test;


class A extends Error{}
class B extends Exception{}


public class InteropTest {
    public static void exceptionInJava(){
        throw new A();
    }
}
