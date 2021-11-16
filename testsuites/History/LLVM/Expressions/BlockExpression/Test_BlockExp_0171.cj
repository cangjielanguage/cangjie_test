// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    let val1 = {
                    var a = -10...10:2
                    a
                }

    // pay attention: support value but not Type
    //var pattern1 = match val1 {
    //    case _ : Range<Int64> => 1
    //    case _ => 0
    //}

    if val1 != (-10...10:2) {
        return 1
    }

    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace