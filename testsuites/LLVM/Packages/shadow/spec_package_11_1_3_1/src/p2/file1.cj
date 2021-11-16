package p2
import p1.C
import p1.Add

interface Minus<T> {
    func minus(other: T): T
}
extend Int64 <: Minus<Int64> {
    func minus(other: Int64): Int64 {
        return this - other
    }
}
func Foo() {
    var obj = C() // OK, the imported class C is visible to all files of current package.
    1.add(2) // OK, the imported extend declaration is visible to all files of current package.
    2.minus(1) // OK, the extend declaration is visible to all files of current package.
}

external var b1 = Foo()