// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

enum TimeUnit<_@1> {  // EXPECTED: regex expected identifier here
    Year(_@1)
}

func run(): Int64 {
    let time = TimeUnit.Year(4)
    return 0
}

func main(): Int64 {
    return run()
}

