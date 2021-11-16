// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main(): Int64 {
    var a = " // EXPECTED: regex-auto string literal is missing
    a
    bc"
    var b = "a // EXPECTED: regex-auto string literal is missing
    bc"
    return 0
}
