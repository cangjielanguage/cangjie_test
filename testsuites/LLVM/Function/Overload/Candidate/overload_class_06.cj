// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    var a: B = B(1)
    var b = a.foo(a)
    if ( b.b != 1 ) {
        return 1
    }
    var c: A = a.foo(a)
    if ( c.a != 2 ) {
        return 2
    }
    return 0
}

open class A {
    var a:Int32
    init(x:Int32){ a = x + 1 }
    open func foo(x:B){
        return A(1)
    }

}

class B <: A {
    var b:Int32
    init(x:Int32){
        super(x)
        b = x
    }
    override func foo(x:B){
        return B(1)
    }
}

