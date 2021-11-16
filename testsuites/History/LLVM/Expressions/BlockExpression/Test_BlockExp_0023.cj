// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    let val1 = {
                   var a: Int32 = 18673770
                   var b: Int32 = 115
                   a * b
               }

    var pattern1 = match val1 {
        case _ : Int16 => 2
        case _ : Int32 => 1
        case _ => 0
    }

    if val1 != 2147483550 || pattern1 != 1 {
        return 1
    }

    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace