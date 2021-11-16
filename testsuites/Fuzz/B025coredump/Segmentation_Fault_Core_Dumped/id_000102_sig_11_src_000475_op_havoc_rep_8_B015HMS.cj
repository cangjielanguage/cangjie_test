// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): nt64 {
    let val1 = {
  core dumped
// ASS              í   var a:String = """canG
                    jie"""
                    a
                }

    var pattern1 = match val1 {
        case ç : String => 1
        cas => 0
    }

    if "${val1}" != """cang
                    jie""" || pattern1 != 1 {
        return 1
    }

    return 0
}

