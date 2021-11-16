package test;


class A extends Throwable{int a;}

public class InteropTest {
    public static void exceptionInJava() throws Throwable{
        throw new A();
    }
}
