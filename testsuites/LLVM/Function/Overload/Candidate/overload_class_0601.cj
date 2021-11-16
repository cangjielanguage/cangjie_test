// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

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
    func foo(x:B){ // EXPECTED: regex error.*?overridden function 'foo' should have 'open' modifier
        return A(1)
    }

}

class B <: A {
    var b:Int32
    init(x:Int32){
        super(x)
        b = x
    }
    func foo(x:B){ // EXPECTED: regex error.*?need 'override' modifier for function 'foo'
        return B(1)
    }
}

