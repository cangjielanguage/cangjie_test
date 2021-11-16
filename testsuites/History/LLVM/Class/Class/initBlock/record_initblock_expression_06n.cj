// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

record Data {
    var i1: Int32 = 2
    init {
        protected let i2: Int32 = 4     // EXPECTED: regex xxx
    }
}

func run(): Int64 {
    var data : Data = Data()
    if (data.i1 == 2 && data.i2 == 4) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
