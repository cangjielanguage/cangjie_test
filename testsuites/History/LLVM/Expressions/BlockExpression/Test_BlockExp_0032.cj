// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    let val1 = {
                   var a: UInt16 = 32652
                   var b: UInt16 = 115
                   a - b
               }

    var pattern1 = match val1 {
        case _ : UInt8 => 2
        case _ : UInt16 => 1
        case _ => 0
    }

    if val1 != 32537 || pattern1 != 1 {
        return 1
    }

    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace