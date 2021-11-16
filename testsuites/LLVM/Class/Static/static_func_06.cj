// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

open class Base {
    static public func foo(x: Int32): String {
        return x.toString()
    }
}

class Data <: Base {
    var a: String = Base.foo(2)
}

func run(): Int64 {
    var data: Data = Data()
    if (data.a != "2") {
        return 1
    }
    return 0
}

func main(): Int64 {
    return run()
}
