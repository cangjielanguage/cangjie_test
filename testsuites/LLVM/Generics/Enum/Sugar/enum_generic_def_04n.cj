// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

enum TimeUnit<> { // EXPECTED: regex expected identifier here
    Year(T)
}

func main(): Int64 {
    let time = TimeUnit.Year(4)
    return 0
}

