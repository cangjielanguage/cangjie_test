package test;

public interface InteropTest {
    default String getStr() {
        return "in java\n";
    }

    default void test(String str) {
        System.out.println(str);
    }
}
