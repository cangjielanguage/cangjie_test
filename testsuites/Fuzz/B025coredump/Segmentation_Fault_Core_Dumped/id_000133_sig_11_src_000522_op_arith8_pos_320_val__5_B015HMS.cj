// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

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
        case d => 0
    }

    if pattern1 != 1 {
        return 1
    }

    return 0
}

// RT: regex-not core dumped
