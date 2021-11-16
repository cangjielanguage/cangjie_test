// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

interface A<X>{
    func foo<Y>(a:Y):Y{a}
}

interface B <: A<Int64>{
    override func foo<Int64>(a:Int64):Int64{a} // EXPECTED: regex 'Int64' is keyword not identifier, you can use '`Int64`' instead
}
class C_B <: B{}

interface C<X> <: A<Int64>{
    override func foo<Int64>(a:Int64):Int64{a}
}
class C_C <: C<Int64>{}

interface D<X> <: A<X>{
    override func foo<Int64>(a:Int64):Int64{a}
}
class C_D <: D<Int64>{}

interface E<X,Y> <: A<X>{
    override func foo<Int64>(a:Int64):Int64{a}
}
class C_E <: E<Int64,Int64>{}


func main(){
    var b : C_B = C_B()
    var c : C_C = C_C()
    var d : C_D = C_D()
    var e : C_E = C_E()
    if (b.foo(1) + c.foo(2) + d.foo(3) + e.foo(4) != 10) {
        return 1
    }
    return 0
}
