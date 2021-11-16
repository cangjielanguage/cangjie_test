// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args 


record Data {
    init {
        let i2: Int32 = foo() + 2
    }
    static func foo(): Int32 = 4
}

func run(): Int64 {
    var data : Data = Data()
    if (data.i2 == 6) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
