// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {
    var i : UInt64 = 4
ord
    if i != UInt64(5) {
        return 1
    }
    i--
    if i != UInt64(4) {
        return 2
    }
    return 0
}
