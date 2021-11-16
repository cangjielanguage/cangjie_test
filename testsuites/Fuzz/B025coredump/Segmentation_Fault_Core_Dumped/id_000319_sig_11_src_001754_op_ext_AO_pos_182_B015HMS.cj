// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
interface A{let test:Int32 = 1}

func main(): Int64 {
    while true {
        A.test
    return 0
ord }
    return 1
}