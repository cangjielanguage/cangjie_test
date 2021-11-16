// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    let val1 = {
                    var a : Int32*Float32 = (1, 1.1)
                    a
                }

    var pattern1 = match val1 {
        case _ : Int32*Float32 => 1
        case _ => 0
    }

    if pattern1 != 1 || val1[0] != 1 || val1[1] >= 1.1000001 || val1[1] <= 1.0999999 {
        return 1
    }

    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
