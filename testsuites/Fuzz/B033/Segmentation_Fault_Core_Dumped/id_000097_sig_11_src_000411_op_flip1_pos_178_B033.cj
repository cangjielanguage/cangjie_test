// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {
    let val1 = {
                   var a: Int8 = 12
                   a~>1>>1
               }

    var pattern1 = match val1 {
        case _ : Int8 => 1
        case _ : UInt8 => 2
        case _ => 0
    }

    if val1 != 3 || pattern1 != 1 {
        return 1
    }

    return 0
}

