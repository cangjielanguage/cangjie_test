// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
let a = 1

func main(): Int64 {

    {a}.toString()

    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace