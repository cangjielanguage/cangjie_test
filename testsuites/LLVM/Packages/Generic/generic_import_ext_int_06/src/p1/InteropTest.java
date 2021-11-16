package p1;

public class InteropTest{
    private static class InnerClass<T> {
        public T num;
        public  InnerClass(T value) {
            this.num = value;
        }
    }
}
