// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


func main(): Int64{
    var a = true
    a ！= false    // EXPECTED: regex illegal symbol '\！\='
    return 0
}