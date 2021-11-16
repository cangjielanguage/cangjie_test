// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT:regex-not core dumped
// ASSERT:regex-not stack trace
func main(): Int64 {
    var i = @{} // EXPECTED: regex array literal type cannot be inferred
    var a : Int64 = @{}.size // EXPECTED: regex array literal type cannot be inferred
    return a
}
