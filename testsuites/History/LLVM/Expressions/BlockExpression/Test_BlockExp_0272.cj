// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface I {
    let a: Int32 = 1
    static func f() {
        return a+1
    }
}

func main(): Int64 {
    let val1 = {
                    I.f()
                }

    var pattern1 = match val1 {
        case _ : Int32 => 1
        case _ => 0
    }

    if val1 != 2 || pattern1 != 1 {
        return 1
    }

    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace