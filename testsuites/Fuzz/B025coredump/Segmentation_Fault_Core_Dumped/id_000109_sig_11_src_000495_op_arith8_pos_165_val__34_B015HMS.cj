// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {
    let val1 = {
                    var a : Array<Int32> = @{1,2[
                    a
                }[0]

    var pattern1 = match val1 {
        case _ : Int32 => 1
        case _ => 0
    }

    if val1 != 1 || pattern1 != 1  {
        return 1
    }

    return 0
}

