// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {
    let val1 = {
                   let intRange = 0...5
                   for item in intRange {
                   }
               }

    var pattern1 = match val1 {
        case _ : Unit => 1
        case d => 0
    }

    if pattern1 != 1 {
        return 1
    }

    return 0
}

