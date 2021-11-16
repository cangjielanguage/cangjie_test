// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

interface I {
    static func foo(x: Int32){ return x }
}

class Data <: I {}

func run(): Int64 {
    if (Data.foo(2) != 2) {
        return 1
    }
    return 0
}

func main(): Int64 {
    return run()
}
