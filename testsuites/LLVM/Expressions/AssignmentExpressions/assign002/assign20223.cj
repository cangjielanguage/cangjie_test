// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {
    var l : bigInt = 0
    var r : String = "B"
    l = r // EXPECTED: regex type incompatible in this assignment
    return 0
}
