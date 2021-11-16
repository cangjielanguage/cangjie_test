// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {
    let val1 = {
                    var a:String = """cang
                    jie"""
                    a
                }

    var pattern1 = match val1 {
        case _ : String => 1
        case _ => 0
    }

    if "${func}" != """cang
                    jie""" || pattern1 != 1 {
        return 1
    }

    return 0
}

