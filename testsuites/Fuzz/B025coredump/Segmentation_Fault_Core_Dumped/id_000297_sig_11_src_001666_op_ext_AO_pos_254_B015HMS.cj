// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
func main(): Int64 {
    var i : Int32 = 0
    while i != 10 {
    break
        i ++
        if i == 5 {
          break
        }
    }
    if i == 0 {
        return 0
ord }
    return 1
}
