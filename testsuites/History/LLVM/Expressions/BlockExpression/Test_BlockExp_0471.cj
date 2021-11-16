// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func test(): Array<Int32>{
    var a : Array<Int32> = @{1,2}
    a
}

func main(): Int64 {
    if test()[0] != 1 || test()[1] != 2{
        return 1
    }

    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace