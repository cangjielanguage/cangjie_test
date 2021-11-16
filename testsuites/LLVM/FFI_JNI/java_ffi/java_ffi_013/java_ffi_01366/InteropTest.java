package test;

public class InteropTest {
    public void test(A a) {
        try {
            a.test();
        } catch(RuntimeException e) {
            System.out.println("throw RuntimeException");
            e.printStackTrace();
        } catch(Exception e) {
            System.out.println("throw Exception");
            e.printStackTrace();
        } catch(Error e) {
            System.out.println("throw Error");
            e.printStackTrace();
        }  catch(Throwable e) {
            System.out.println("throw Throwable");
            e.printStackTrace();
        }
    }
}
