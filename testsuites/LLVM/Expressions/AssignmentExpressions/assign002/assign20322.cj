// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {
    var l : Int32 = 2
    var r : Int32
    l = r // EXPECTED: regex variable 'r' is used before initialization
    return 0
}
