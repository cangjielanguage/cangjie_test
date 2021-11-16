package p1

foreign func native_entry(c: Int32): Int32
func ark_entry(a: Int32, b: Int32): Int32 {
    unsafe { return native_entry(a + b) }
}

class B<T> {
    func bar() {
        let a: Int32 = 1
        let b: Int32 = a
        unsafe { return native_entry(a + b) }
    }
}

external class A<T>{
    func goo() {
        unsafe { return native_entry(10 + 8) }
    }
    func noo() {
        return ark_entry(40, 2)
    }
}

external class C<T>{
    var a : B<T> = B<T>()
}