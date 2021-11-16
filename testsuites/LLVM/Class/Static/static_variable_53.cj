// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record Data {
    static let a: Int32 = 2
    // init {}
    var b: Int32
    init() {
        b = a + 1
    }
}

func run(): Int64 {
    var data: Data = Data()
    if (Data.a == 2 && data.b == 3) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
