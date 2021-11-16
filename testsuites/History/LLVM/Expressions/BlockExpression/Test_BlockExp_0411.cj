// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func test(): Bool{
    var a: Bool = false
    a
}

func main(): Int64 {
    if test() {
        return 1
    }

    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace