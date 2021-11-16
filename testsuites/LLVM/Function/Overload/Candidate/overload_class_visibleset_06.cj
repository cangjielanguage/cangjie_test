// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

open class Base {
    var a:Int32 = 1
    init(x: Int32){
        this.a = x
    }
    open func bar(): Int64{1}
}

class A <: Base {
    init(x: Int32){
        super(x)
    }
    func foo(x:Int32):Int64 {
        super.bar()
    }
    override func bar(): Int64 { 4 }
}

func main(): Int64 {
    var res = A(2)
    var res1 = res.foo(1)
    if (res1 == 1 && res.a == 2) {
        return 0
    }
    return 1
}
