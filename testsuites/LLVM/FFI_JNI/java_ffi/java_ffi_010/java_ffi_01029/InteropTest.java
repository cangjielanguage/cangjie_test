package test;

public class InteropTest {
    public char[] array = {'j', 'a', 'v', 'a'};

    public char[] getArray() {
        return array;
    }

    public void test(char[] myList) {
        System.out.println(String.valueOf(myList));
    }
}
