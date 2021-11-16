// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class Data {
    static func foo(x: Int32): Int32 {
        return x + 2
    }
}

func run(): Int64 {
    var res: Int32 = Data.foo(2)
    if (res != 4) {
        return 1
    }
    return 0
}

func main(): Int64 {
    return run()
}
