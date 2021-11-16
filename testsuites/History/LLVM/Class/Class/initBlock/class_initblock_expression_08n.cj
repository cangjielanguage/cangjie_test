// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


class Data {
    init {
        var i: Int32 = 4
        i = 5    // EXPECTED: regex xxx
    }
}

func run(): Int64 {
    var data : Data = Data()
    if (data.i == 5) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
