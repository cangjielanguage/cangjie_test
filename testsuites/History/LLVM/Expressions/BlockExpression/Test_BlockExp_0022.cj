// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    let val1 = {
                   var a: Int16 = 32652
                   var b: Int16 = -115
                   b - a
               }

    var pattern1 = match val1 {
        case _ : Int16 => 1
        case _ => 0
    }

    if val1 != -32767 || pattern1 != 1 {
        return 1
    }

    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace