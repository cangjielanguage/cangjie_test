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
    open func ioo(x:B){
        return B(1)
    }
}

class B <: A {
    var b:Int32
    init(x:Int32){
        super(x)
        b = x
    }
    override func ioo(x:B){ // EXPECTED: regex error.*?return type of 'ioo' is not identical or not a subtype of the overridden/redefined function
        return A(1)
    }
}

