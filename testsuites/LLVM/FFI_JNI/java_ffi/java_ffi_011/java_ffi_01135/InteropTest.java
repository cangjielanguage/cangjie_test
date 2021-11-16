package test;

public class InteropTest<T> {
    public T[] test(T... args) {
        for(T arg : args) {
            System.out.print(arg);
        }
        return args;
    }
}
