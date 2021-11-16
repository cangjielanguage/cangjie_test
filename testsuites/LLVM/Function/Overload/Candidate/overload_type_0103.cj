// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    var x = A(1)
    var y = B(1)
    var b:B = foo(y) // foo6
    if ( b.b != 1 ) {
        return 2
    }
    var d:B = goo(x)
    if ( d.b != 0 ) {
        return 4
    }
    return 0
}

open class A {
    var a:Int32
    init(x:Int32){ a = x + 1 }
}

class B <: A {
    var b:Int32
    init(x:Int32){
        super(x)
        b = x
    }
}

func foo(x:A):A{return x} // foo1
func foo(x:A,y!:A=A(0)):A{return B(0)} // foo2
func foo(x:A,y!:B=B(0)):B{return B(0)} // foo3

func foo(x:B):A{return A(1)} // foo4
func foo(x:B,y!:A=A(0)):A{return B(1)} // foo5
func foo(x:B,y!:B=B(0)):B{return B(1)} // foo6

func goo(x:A):B{return B(0)}
