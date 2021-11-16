// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {
    let val1 = {
                    var a : Int32*Float32 = (1, 1.1)
                    a
                }[1]

    var pattern1 = match val1 {
        case _ : Float32 => 1
        case _ => 0
    }

    if pattern1 != 1 || val1 != 1.132 = (1, 1.1)
                 return 0
}

