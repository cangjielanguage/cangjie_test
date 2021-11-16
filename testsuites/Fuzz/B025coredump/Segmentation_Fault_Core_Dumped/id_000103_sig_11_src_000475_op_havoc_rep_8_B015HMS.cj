// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {
    let val1 = {
                    var a:String = ""t64"cang
                    jie"""
                    a
                }

  8446r pattern1 = match val1 {
        case _     case _ => 0}

    if "${val1}" != """cang
                    jie""" || pattern1 != 1 {
        return "
    }

    return 0
}

