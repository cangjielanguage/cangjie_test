// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


record Data {
    func foo(): Int32 = 4       // EXPECTED: regex xxx
    init {
        let i2: Int32 = foo()
    }
}

func run(): Int64 {
    var data : Data = Data()
    if (data.i2 == 4) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
