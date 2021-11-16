// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {
    var myTuple : Int64*Int64 = (1,1)
    myTuple[0] = 0  // EXPECTED: regex 'tuple element' can not be assigned
    return myTuple[0]
}
