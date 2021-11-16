// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

open class Base{
    func foo(x: Int32): String{
        return x.toString()
    }
}

class Test <: Base {
    var a: String = ""
    var b: (Int32)->String = { a: Int32 => ""}
    init(){}
    init(x: Int32){
        this()
        a = this.foo(x)
        b = this.foo
    }
}

func run(): Int64 {
    var test: Test = Test(3)
    var res1: String = test.a
    var res2: String = test.b(4)
    if (res1 == "3" && res2 == "4") {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
