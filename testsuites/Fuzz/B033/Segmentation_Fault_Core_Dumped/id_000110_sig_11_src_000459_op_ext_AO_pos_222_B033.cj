// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {
    let val1 = {
                    var a : Array<Int32>
                }

    var pattern1 = match val1 {
        case funcunit => 1
        case _ => 0
    }

    if pattern1 != 1 {
        return 1
    }

    return 0
}

