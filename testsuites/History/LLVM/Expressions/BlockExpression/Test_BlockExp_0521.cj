// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class Data {
    var data: Int32 = 1
}

func test(): Data{
    Data()
}

func main(): Int64 {
    if test().data != 1 {
        return 1
    }

    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace