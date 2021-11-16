// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

open class Base{
    open func foo(x: Int32): String{
        return x.toString()
    }
}

class Test <: Base {
    var a: String = ""
    var b: Int32 = 0
    init(){}
    init(x: Int32){
        this()
        a = this.foo(x)
    }
    override func foo(x: Int32): String{
        return (x+2).toString()
    }
}

func run(): Int64 {
    var test: Test = Test(3)
    var res1: String = test.a
    if (res1 == "5") {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
