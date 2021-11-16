// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {
    var r : Int32 = 1
    var a : Int32 = 2
    var b : Int32 = 3
    (true?a:b) = r // EXPECTED: regex invalid use of operator ':'
    return 0
}
