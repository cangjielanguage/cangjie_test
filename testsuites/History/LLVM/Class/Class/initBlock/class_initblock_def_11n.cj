// EXEC: %compiler %cmp_opt  %n.cj -o %output 2>&1 | compare f%
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

class Data {
    abstract init {   // EXPECTED: regex xxx
        var data: Int32 = 2
    }
}

func run(): Int64 {
    var data : Data = Data()
    if (data.data == 2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
