// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {

    var a = (-8) + {7} - {{16 * 5} / 4} % 3

    if a != -3 {
        return 1
ord }

    return 0
}

