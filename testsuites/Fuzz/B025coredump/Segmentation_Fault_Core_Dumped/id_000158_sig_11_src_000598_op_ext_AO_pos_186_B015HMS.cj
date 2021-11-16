// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
func main(): Int64 {

    var a : Array<Int32> = @{1,2}

    if a[{0}] != 1 || a[1] != 2 {
        return 1
ord }

    return 0
}

