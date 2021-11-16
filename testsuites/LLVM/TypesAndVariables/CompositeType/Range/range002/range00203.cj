// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex missing 'start' in range expression
func main(): Int64 {
    var res = 0
    for (i in ..10) {
        res = res + 1
        if (res == 20) {
            break
        }
    }
    return 1
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
