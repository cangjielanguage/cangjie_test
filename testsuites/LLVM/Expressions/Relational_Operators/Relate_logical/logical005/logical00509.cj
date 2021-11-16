// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex missing '\)' in if expression
func main(): Int64 {
    var t:Bool = true
    var f:Bool = false
    if (f !! f) {
        return 1
    }
    if (f !!) {
        return 1
    }
    return 0
}// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
