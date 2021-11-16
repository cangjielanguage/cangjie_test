// EXEC: %compiler %cmp_opt  %n.cj -o %output 2>&1 | compare f%
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

trait Add{
    init {      // EXPECTED: regex xxx
        var i: Int32 = 2
    }
}

func run(): Int64 {
    return 0
}

func main(): Int64 {
    return run()
}
