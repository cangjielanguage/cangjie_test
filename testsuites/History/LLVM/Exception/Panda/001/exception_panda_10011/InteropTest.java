package test;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.ThreadFactory;


class A implements Runnable{
    @Override
    public void run() {
        throw new RuntimeException("exception in thread!");
    }
}


public class InteropTest {
    public static void exceptionInJava() throws Throwable{
        try {
            Thread thread = new Thread(new A());
            thread.start();
        } catch (Exception e) {
            System.out.println("catch in java");
            e.printStackTrace();
        } finally {
        }
        System.out.println(123);
    }
}
