// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record Data {
    static let a: Int32 = 2
    static let b: Int32 = Data.a
}

func run(): Int64 {
    if (Data.a == 2 && Data.b == 2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
