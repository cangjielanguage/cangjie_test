// EXEC: %compiler %cmp_opt  %n.cj -o %output 2>&1 | compare f%
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func run(): Int64 {
    var i = 0
    if (i > 10) {
        return 1
    } else {
        init {      // EXPECTED: regex xxx
            var i: Int32 = 2
        }
        return 0
    }
}

func main(): Int64 {
    return run()
}
