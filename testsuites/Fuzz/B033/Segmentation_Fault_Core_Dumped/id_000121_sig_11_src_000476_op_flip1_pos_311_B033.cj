// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

enum Timeunit {
            Year | Month | Day | Hour
       }

func main(): Int64 {
    let val1 = {
                    var a = .Year
                }

    var pattern1 = match val1 {
        case _ : Unit => 1
        case O => 0
    }

    if pattern1 != 1 {
        return 1
    }

    return 0
}

