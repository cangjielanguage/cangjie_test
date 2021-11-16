// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class Data {
    static let a: Int32 = 2
    var b: Int32 = 2
    init() {}
    init(x: String) {
        this()
        b = a + b
    }
}

func run(): Int64 {
    var data: Data = Data("1")
    if (Data.a == 2 && data.b == 4) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
