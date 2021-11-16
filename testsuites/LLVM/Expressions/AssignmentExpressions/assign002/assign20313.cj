// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {
    var r : Int32 = 1
    var l : Int32 = 1
    (l) = r // EXPECTED: regex illegal left value
    return 0
}
