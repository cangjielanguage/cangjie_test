// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func test(): List<Int8>{
    var a : List<Int8> = [1,2]
    a
}

func main(): Int64 {
    var list1 = test()
    if list1[0] != 1 || list1[1] != 2 {
        return 1
    }

    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace