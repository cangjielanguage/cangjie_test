// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex missing 'stop' in range expression
func main(): Int64 {
    var r = -10..
    var res = 0
    for (i in r) {
        res = res + 1
        if (res == 20) {
            break
        }
    }
    return 1
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
