// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {

    var array1: Array<Int32> = @{0,{1},2,3,4}
    var mark = 0

    for item in array1 {
        if item != array1[mark]{
            return 1
        }
        mark = mark + 1
    }

    if mark != 5 {
        return 1
    }

    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace