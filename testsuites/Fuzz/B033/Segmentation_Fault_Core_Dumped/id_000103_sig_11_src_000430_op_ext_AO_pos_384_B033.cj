// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {
    let val1 = {
                   let intRange = 0...5
                   for item in intRange {
                       if item == 3 {
                           break
                       }
                   }
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

