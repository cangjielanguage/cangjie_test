// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    var x: A = A(1)
    var y: B = B(1)
    var e = y.goo(x) // goo1
    if ( e.a != 2 ) {
        return 1
    }
    var f: A = y.goo(y) // goo1
    if ( f.a != 2 ) {
        return 2
    }
    var g = y.goo(y) // goo2
    if ( g.b != 1 ) {
        return 3
    }
    return 0
}

open class A {
    var a:Int32
    init(x:Int32){ a = x + 1 }
    func goo(x:A){ // goo1
        return A(1)
    }

}

class B <: A {
    var b:Int32
    init(x:Int32){
        super(x)
        b = x
    }
    func goo(x:B){ // goo2
        return B(1)
    }
}

