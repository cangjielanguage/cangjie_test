// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


class Data {
    init {
        let i2: Int32 = i1      // EXPECTED: regex xxx
        let i1: Int32 = 3
    }
}

func run(): Int64 {
    var data : Data = Data()
    if (data.i1 == 3) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
