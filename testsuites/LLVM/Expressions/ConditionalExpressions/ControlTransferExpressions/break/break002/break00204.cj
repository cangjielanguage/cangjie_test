// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex 'break' or 'continue' must be in a loop
func main(): Int64 {
    var i : Int32 = 0
    while (i != 10) {
        i ++
        if (i == 5) {
          break
        }
    }
    break
    if (i == 5) {
        return 0
    }
    return 1
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
