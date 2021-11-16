// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {
    let val1 = {
                   var a: Int8 = 12
                   a<#1<<1
               }

    var pattern1 = match val1 {
        case _ : Int8 => 1
        case _ : Int16 => 2
        case _ : Int32 => 3
        case _ : Int64 => 4
        case _ => 0
    }

    if val1 != 48 || pattern1 != 1 {
        return 1
    }

    return 0
}

