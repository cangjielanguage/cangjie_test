// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

enum TimeUnit(T) {   // EXPECTED: regex expected '{' here
    Year(T)
}

func run(): Int64 {
    var time = TimeUnit<Int64>.Year(2)
    return 0
}

func main(): Int64 {
    return run()
}

