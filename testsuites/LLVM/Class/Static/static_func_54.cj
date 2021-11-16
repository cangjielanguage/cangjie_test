// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

interface I {
    static func foo(x: Int32){ return x }
    static func coo(x: Int32): Int32{
        return foo(x)
    }
}
class Test <: I{}

func run(): Int64 {
    if (Test.coo(2) != 2) {
        return 1
    }
    return 0
}

func main(): Int64 {
    return run()
}
