// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    let a = 1
    {a}

    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace