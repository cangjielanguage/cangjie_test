// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func test(): Int32*Float32{
    var a : Int32*Float32 = (1, 1.1)
    a
}

func main(): Int64 {
    if test()[0] != 1 || test()[1] >= 1.1000001 || test()[1] <= 1.0999999 {
        return 1
    }

    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
