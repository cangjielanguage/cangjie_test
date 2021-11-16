// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class Data  {
    static let a: Int32 = 1
    static func foo():Int32 { return Data.a }
}

func run(): Int64 {
    if (Data.foo() != 1 || Data.a != 1) {
        return 1
    }
    return 0
}

func main(): Int64 {
    return run()
}
