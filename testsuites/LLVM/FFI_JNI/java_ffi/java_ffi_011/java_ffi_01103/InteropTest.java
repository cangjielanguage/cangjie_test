package test;

public class InteropTest {
    public char[] array;

    public char[] getArray(String str) {
        array = str.toCharArray();
        return array;
    }

    public void test(char... args) {
        for(char arg : args) {
            System.out.print(arg);
        }
    }
}
