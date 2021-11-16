// EXEC: %compiler %cmp_opt  %n.cj -o %output 2>&1 | compare f%
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func run(): Int64 {
    var hundred = 0
    while (hundred < 100) {
        init {      // EXPECTED: regex xxx
            var i: Int32 = 2
        }
        hundred++
    }
    return 0
}

func main(): Int64 {
    return run()
}
