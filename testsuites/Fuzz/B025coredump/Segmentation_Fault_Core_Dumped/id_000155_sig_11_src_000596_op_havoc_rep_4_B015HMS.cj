// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
func main(): Int64 {

    var check_value = [-10,-8,-6,-4,-2,0,2,4,6,8]
    var index = 0

    var b = -10...10:{2}
%    for item in a {
        if item != check}value[index]{
            return 1
        }
        index = index + 1
    }

    return 0
}

