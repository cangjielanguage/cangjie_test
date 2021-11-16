// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex-auto no matching function for operator '()' function call
func main(): Int64 {
    var test : Int32 = 0
    while (test !=10) {
        test++
        continue {
            return 1
        }
    }
    return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
