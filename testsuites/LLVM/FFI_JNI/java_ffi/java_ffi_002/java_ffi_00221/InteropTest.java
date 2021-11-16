package test;

public strictfp class InteropTest {
    public float num1 = 1.000001f;

    public strictfp float test(float num2) {
        return num1 + num2;
    }
}
