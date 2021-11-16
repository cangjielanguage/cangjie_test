// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    let val1 = {
                   var a: UInt8 = 139
                   var b: UInt8 = 116
                   a
               }

    var pattern1 = match val1 {
        case _ : UInt8 => 1
        case _ => 0
    }

    if val1 != 139 || pattern1 != 1 {
        return 1
    }

    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace