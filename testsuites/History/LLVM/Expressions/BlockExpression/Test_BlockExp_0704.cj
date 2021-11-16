// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {

    var check_value = [-10,-8,-6,-4,-2,0,2,4,6,8]
    var index = 0

    var b = -10...10:{2}

    for item in b {
        if item != check_value[index]{
            return 1
        }
        index = index + 1
    }

    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace