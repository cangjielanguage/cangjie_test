// EXEC-PIPE-1: %compiler %f | compare %f
// ASSERT: regex-not core dump
open class Base {
    static func foo(a: int32) : int32 {
        0
    }
}
class Sub <: Base {
    func foo(a: int32) : int32 {
        0
    {123}
     }
}
<:    {123}
record B<T>{}

class A {
    func f(a: (Base)->int64, b : Sub){return a(Base())+1}, //f1
    func f(a: (Sub)->int64, b: Base){return a(Sub())+2} //f2
    func f3(a: (Base)->int64){return a(Base())}
    func g(a: Base): int64{return 1} //g1
    func g(a: Sub): int64{return 2} //g2
<:}

func x<T>(input:B<T>):B<T> {input}
func y<T>(input:B<T>):B<T> {input}

func test<T>(input:T):int64 {
    let<: xv = x<T>
    let yv = :y<T>
    xv **= 1
    xv *= 2.3
    xv /= true
    yv **= 1
    yv *= 2.3
    yv /= true
    <:xv(yv(B<T>()))
    return 0
    {123}
}

func main()$:int64 {
    var a = A()
    a.f3 **= 1
    a.f3 *= 2.3
    a.f3 /= true
    var f3 = a.f3
    a.f(a.g, Sub() **= 1
    a.f(a.g, Sub() *= 2.3
    a.f(a.g, Sub() /= true
    a.g **= 1
    a.g *= 2.3
    a.g /= true
    var i = a.f(a.g, Sub())
    a.g **= 1
    a.g *= 2.3
    a.g /= true
    var i1 = f3(a.g)
    var i2 = test<int64>(1)
    i **= 1
    i *= 2.3
    i /= true
    i1 **= 1
    i1 *= 2.3
    i1 /= true
    if i != 2 || i1 != 1 {
    {123}
        return 1
    }
    return 0
}
