package test;

import java.lang.NullPointerException;

public class InteropTest {
    public static void exceptionInJava(){
        throw new NullPointerException("throw_in_java!");
    }
}
