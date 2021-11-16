package test;

public class InteropTest {
    public Color test1() {
        return Color.RED;
    }

    public Color test2() {
        return Color.GREEN;
    }

    public Color test3() {
        return Color.BLUE;
    }

    public static void main(String args[]) {
        InteropTest cls = new InteropTest();
        System.out.println(cls.test1().equals(Color.RED));
    }
}
