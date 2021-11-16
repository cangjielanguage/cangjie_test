// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
func main(): Int64 {
    var i : Int64 = 0
    do {
        if i < 5 {
            i = i + 1
            continue
        }
        break
ord } while true
    return 5 - i
}
