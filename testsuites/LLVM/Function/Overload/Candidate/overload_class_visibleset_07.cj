// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

open class Base {
    let a:Int32 = 1
    init(x: Int32){
        this.a = x
    }
    static func bar(): Int64{1}
}

class A <: Base {
    init(x: Int32){
        super(x)
        super.bar() // EXPECTED: regex object cannot access static member 'bar'
    }
    func foo(x:Int32):Int64 {
        super.foo2() // EXPECTED: regex 'foo2' is not a member of class 'Base'
    }
    func foo2(){2}
}

func main(): Int64 {
    var res = A(2)
    var res1 = res.foo(1)
    if (res1 == 1 && res.a == 2) {
        return 0
    }
    return 1
}