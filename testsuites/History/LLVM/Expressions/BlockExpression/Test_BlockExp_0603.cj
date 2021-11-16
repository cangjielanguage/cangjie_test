// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {    // DTS202011230J8XHFP1M00
    var a = 1
    {a}

    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace