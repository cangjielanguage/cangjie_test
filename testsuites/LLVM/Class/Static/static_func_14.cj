// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

interface I {
    func foo(x: Int32): Int32
}

class Data <: I {
    func foo(x: Int32): Int32 { return x + 2 }
}

func run(): Int64 {
    var data: Data = Data()
    if (data.foo(2) != 4) {
        return 1
    }
    return 0
}

func main(): Int64 {
    return run()
}
