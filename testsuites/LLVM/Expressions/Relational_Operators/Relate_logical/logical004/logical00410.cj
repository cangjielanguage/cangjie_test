// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex expected expression here
func main(): Int64 {
    var t:Bool = true
    var f:Bool = false
    if (||) {
        return 1
    }
    if (||t) {
        return 1
    }
    if (f|| ) {
        return 1
    }
    return 0 
}// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
