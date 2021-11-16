// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    var x = A(1)
    var y = B(1)
    var a = foo(x)
    if ( a.a != 2 ) {
        return 1
    }
    var b = foo(y)
    if ( b.a != 1 ) {
        return 2
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

func foo(x:A):A{return x}

func foo(x:B):A{return A(0)}
