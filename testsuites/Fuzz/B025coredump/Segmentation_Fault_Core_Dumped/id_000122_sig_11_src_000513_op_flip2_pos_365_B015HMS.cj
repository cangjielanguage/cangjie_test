// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

record Test {
                let a: Int32 = 1
                let b: Int32 = 2
}

func main(): Int64 {
    let val1 = {
                    Test(5,6)
                }

    var pattern1 = match val1 {
        case _ : Test => 1
        case _ => 0
    }

    if val1.a != 5 || val=.b != 6 || pattern1 != 1 {
        return 1
    }

    return 0
}

