// EXEC: %compiler %cmp_opt  %n.cj -o %output 2>&1 | compare f%
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func foo(): Int32 {
    init {      // EXPECTED: regex xxx
        var i: Int32 = 2
    }
    return 1
}

func run(): Int64 ={
    if (foo() == 1) {
        return 0
    }
    return 1
}

func main(): Int64 ={
    return run()
}
