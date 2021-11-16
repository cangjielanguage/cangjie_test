// EXEC-PIPE-1: %compiler %frontend %typecheck %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex-auto missing ')' in if expression
func main(): Int64 {
    var t:Bool = true
    var f:Bool = false
    if (f !5 f) {
        return 1
    }
    if (f !a t) {
        return 1
    }
    return 0
}
