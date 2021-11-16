// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface A<X>{
    func foo():X
}

interface B <: A<Int32>{}
class C_B <: B{
    func foo():Int32{1}
}

interface C<X> <: A<Int32>{}
class C_C <: C<Int32>{
    func foo():Int32{2}
}

interface D<X> <: A<X>{}
class C_D <: D<Int32>{
    func foo():Int32{3}
}

interface E<X,Y> <: A<X>{}
class C_E <: E<Int32,Int32>{
    func foo():Int32{4}
}


func main(){
    var b : C_B = C_B()
    var c : C_C = C_C()
    var d : C_D = C_D()
    var e : C_E = C_E()
    if (b.foo() + c.foo() + d.foo() + e.foo() != 10) {
        return 1
    }
    return 0
}