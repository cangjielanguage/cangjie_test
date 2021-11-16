// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT:regex-not core dumped
// ASSERT:regex-not stack trace
func main(): Int64 {
    var a : Array<Int32>
    a.size // EXPECTED:regex variable 'a' is used before initialization
    return 0
}
