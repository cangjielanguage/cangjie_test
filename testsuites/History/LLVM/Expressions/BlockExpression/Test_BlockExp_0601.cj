// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
var a = 1

func main(): Int64 {
    var test_a = {a}
    test_a.toString()

    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace