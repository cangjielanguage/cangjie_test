// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func main(): Int64 {
    var myTuple : Int64*Int64 = (1,0)
    var a = myTuple.__1 // EXPECTED: regex expected identifier here
    return a
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
