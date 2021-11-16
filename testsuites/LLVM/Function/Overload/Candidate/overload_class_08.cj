// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    var x: A = A(1)
    var y: B = B(1)
    var b = y.foo(x) // foo2
    if ( b.b != 1 ) {
        return 1
    }
    var c: A = y.foo(y) // foo1
    if ( c.a != 2 ) {
        return 2
    }
    var d = y.foo(y) // foo1
    if ( d.a != 2 ) {
        return 2
    }
    return 0
}

open class A {
    var a:Int32
    init(x:Int32){ a = x + 1 }
    func foo(x:B){ // foo1
        return A(1)
    }

}

class B <: A {
    var b:Int32
    init(x:Int32){
        super(x)
        b = x
    }
    func foo(x:A){ // foo2
        return B(1)
    }
}

