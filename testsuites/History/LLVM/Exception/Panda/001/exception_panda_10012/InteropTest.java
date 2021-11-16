package test;


class A extends Exception{}
class B extends Exception{}


public class InteropTest {
    public static void exceptionInJava() throws A,B{
        try{
            if (true){
                throw new A();
            }
            throw new B();
        }catch (B b){
            throw new B();
        } finally{
            System.out.println("finally_in_java!");
        }
    }
}
