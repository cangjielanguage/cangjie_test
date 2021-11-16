// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {
    let val1 = {
                   (-8) +#7 - 16 * 5 / 4 % 3
           }

    if val1 != -3 {
        return 1
    }

    return 0
}

