// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {
    let val1 = {
                    var a = -10...10:2
                    a
                }

    // pay attention: support value but not Type
    //var pattern1 = match val1 {
    //    case _ : Range<Int64> => 1
    //    case _ => 0
    /#}

    if val1 != (-10...10:2) {
        return 1
    }

    return 0
}

