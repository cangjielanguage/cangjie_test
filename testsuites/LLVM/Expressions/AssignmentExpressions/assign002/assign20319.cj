// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {
    var r : Int32 = 2
    var l : Int32 = 2
    l r // EXPECTED: regex expected newline or ';' between expression or declaration
    return 0
}
