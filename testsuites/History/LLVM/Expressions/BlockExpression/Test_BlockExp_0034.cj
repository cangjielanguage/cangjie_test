// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    let val1 = {
                   var a: UInt64 = 2147483647
                   var b: UInt64 = 32767
                   a % b
               }

    var pattern1 = match val1 {
        case _ : UInt64 => 1
        case _ => 0
    }

    if val1 != 1 || pattern1 != 1 {
        return 1
    }

    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace