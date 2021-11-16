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
                    var a = I.f()
                }

    var pattern1 = match val1 {
        case _ : Unit => 1
        case _ => 0
    }

    if pattern1 != 1 {
        return 1
    }

    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace