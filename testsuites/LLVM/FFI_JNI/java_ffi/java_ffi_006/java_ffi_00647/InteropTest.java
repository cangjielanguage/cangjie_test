package test;

public class InteropTest {
    public <T extends Animal> void test(T value) {
        System.out.println("num = " + value.num);
    }
}
