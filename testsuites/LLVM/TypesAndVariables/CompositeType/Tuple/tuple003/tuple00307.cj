// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func main(): Int64 {
    var myTuple : Int32*Int32 = (0,1)
    var a = myTuple[-1] // EXPECTED: regex tuple index must be in bounds
    return a
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
