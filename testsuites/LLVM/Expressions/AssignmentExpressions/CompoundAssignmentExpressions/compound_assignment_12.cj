// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


func main(): Int64 {
    var a = 2
    var b = "String"
    b += a   // EXPECTED: regex type incompatible in this compound assignment expression
    return 0
}