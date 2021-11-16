package test;

public interface InteropTest<T> {
    public void test(int num1, int num2, T... args);
}
