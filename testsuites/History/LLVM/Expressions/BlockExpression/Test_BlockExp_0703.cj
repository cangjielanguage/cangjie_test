// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {

    var a : Int32*Float32 = (1, {1.1})

    if a[0] != 1 || a[1] >= 1.1000001 || a[1] <= 1.0999999 {
        return 1
    }

    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
