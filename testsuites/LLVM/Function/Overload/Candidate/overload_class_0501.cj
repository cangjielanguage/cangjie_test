// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    var a: B = B(1)
    var b = a.foo(a)
    if ( b != 1) {
        return 1
    }
    return 0
}

open class A {
    var a:Int32
    init(x:Int32){ a = x + 1 }
    func foo(x:B):Int32{ // EXPECTED: regex error.*?overridden function 'foo' should have 'open' modifier
        return 1
    }
}

class B <: A {
    var b:Int32
    init(x:Int32){
        super(x)
        b = x
    }
    func foo(x:B):Int32{ // EXPECTED: regex error.*?need 'override' modifier for function 'foo'
        return 2
    }
}

