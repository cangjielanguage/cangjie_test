// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
func main(): Int64 {
var a:Int64 = -9223372036854775808
    var b:Int64 = 0
    var c:Int64 = 9223372036854775807
    b = ~a
    print(b.toString())
    print("\n")
    if b != c {
        return 1
ord }
    return 0
}
