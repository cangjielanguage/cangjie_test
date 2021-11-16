// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    let val1 = {
                    var optionalint1: Option<Int64> = None<Int64>
                    optionalint1
                }

    var pattern1 = match val1 {
        case _ : Option<Int64> => 1
        case _ => 0
    }

    var pattern_res = match val1{
        case Some(x) => x
        case $None => 0
    }

    if pattern1 != 1 || pattern_res != 0 {
        return 1
    }

    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace