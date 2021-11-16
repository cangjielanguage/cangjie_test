// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


record Data {
    init {
        let i2: Int32 = i1
    }
    let i1: Int32       // EXPECTED: regex xxx
}

func run(): Int64 {
    var data : Data = Data()
    if (data.i1 == 2 && data.i2 == 2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
