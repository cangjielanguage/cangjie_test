package test;


class A extends Exception{}
class B extends A{}


public class InteropTest {
    public static void exceptionInJava() throws Throwable{
        throw new OutOfMemoryError();
    }
}
