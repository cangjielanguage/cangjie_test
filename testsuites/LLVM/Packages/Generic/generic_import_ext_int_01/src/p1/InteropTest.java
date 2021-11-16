package p1;

public class InteropTest{
    public static class InnerClass<T> {
        public T num;
        public  InnerClass(T value) {
            this.num = value;
        }
        public <T> void show(T t) {
            System.out.println(t);
        }
    }
}