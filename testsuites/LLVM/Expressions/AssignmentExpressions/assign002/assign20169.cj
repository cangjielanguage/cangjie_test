// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {
    var l : Float16 = 0
    var r : Float32 = 1
    l = r // EXPECTED: regex type incompatible in this assignment
    return 0
}
