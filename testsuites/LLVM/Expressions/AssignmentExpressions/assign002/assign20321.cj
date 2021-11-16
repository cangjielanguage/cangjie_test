// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 { // EXPECTED: regex type of function body is incompatible with return type
    var l : Int32 = 2
    l =
    return 0
}
