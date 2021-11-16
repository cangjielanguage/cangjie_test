// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record Test {
    let a: Int32 = 1
    let b: Int32 = 2
    init (a: Int32, b: Int32) {
        this.a = a
        this.b = b
    }
}

func main(): Int64 {
    let val1 = {
                    var a = Test(5,6)
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