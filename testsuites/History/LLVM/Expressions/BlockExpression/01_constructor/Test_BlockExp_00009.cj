// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    let val1 = {
                    var a: Int8 = 12
                    var b: Int8 = 13
                    var c: Int8 = 13
                    var d: Int8 = 13
                    a+b
                    c+d
                }

    var pattern1 = match val1 {
        case _ : Int8 => 1
        case _ => 0
    }

    if pattern1 != 1 {
        return 1
    }

    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace