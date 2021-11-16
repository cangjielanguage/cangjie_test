// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    let val1 = {
                    var a : Array<Int32> = @{1,2}
                    a
                }

    var pattern1 = match val1 {
        case _ : Array<Int32> => 1
        case _ => 0
    }

    if val1[0] != 1 || val1[1] != 2 || pattern1 != 1 {
        return 1
    }

    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace