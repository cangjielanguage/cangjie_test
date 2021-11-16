// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
func main(): Int64 {
    var t:Bool = true
    var f:Bool = false
    if (f ||| f) { // EXPECTED: regex expected expression here
        return 1
    }
    if (f ||| t) {
        return 1
    }
    return 0
}// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
