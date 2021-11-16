// EXEC: %compiler %cmp_opt  %n.cj -o %output 2>&1 | compare f%
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


init {   // EXPECTED: regex xxx
    var data: Int32 = 2
}

func run(): Int64 {
    if (data == 2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
