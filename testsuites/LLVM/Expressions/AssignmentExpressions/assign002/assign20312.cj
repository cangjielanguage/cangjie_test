// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
enum A{a(Int32)}
func main(): Int64 {
    var r : Int32 = 1
    A.a(1) = r // EXPECTED: regex illegal left value
    return 0
}
