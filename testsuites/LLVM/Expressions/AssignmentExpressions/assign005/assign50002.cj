// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {
    var l_a : Int32 = 4
    l_a = Int8 // EXPECTED: regex-auto illegal expression on the right of '=', which must be conventional expression
    return 1
}
