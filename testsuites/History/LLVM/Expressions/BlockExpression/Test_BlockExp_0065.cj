// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    let val1 = {
                   var a: Int8 = 10
                   var b: Int8 = 15
                   a ^ b
               }

    var pattern1 = match val1 {
        case _ : Int8 => 1
        case _ : UInt8 => 2
        case _ => 0
    }

    if val1 != 5 || pattern1 != 1 {
        return 1
    }

    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace