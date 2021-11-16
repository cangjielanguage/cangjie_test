// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {
    var r : Bool = true
    var a : Bool = false
    var b : Bool = false
    a&&b = r // EXPECTED: regex illegal left value
    a||b = r // EXPECTED: regex illegal left value
    return 0
}
