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
    func foo(x:B):Int32{
        return 1
    }
    open func goo(x:B):Int32{
        return 1
    }
    open func hoo(x:B){
        return Int32(1)
    }
}

class B <: A {
    var b:Int32
    init(x:Int32){
        super(x)
        b = x
    }
    func foo(x:B):Int64{ // EXPECTED: regex error.*?The return type of the override/redefine/implement function must be the same as or a subtype of the overridden/redefined/implemented function
        return 2
    }
    override func goo(x:B):Int64{ // EXPECTED: regex error.*?return type of 'goo' is not identical or not a subtype of the overridden/redefined function
        return 2
    }
    override func hoo(x:B){ // EXPECTED: regex error.*?return type of 'hoo' is not identical or not a subtype of the overridden/redefined function
        return Int64(2)
    }
}

