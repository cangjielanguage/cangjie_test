// ERRCHECK: %compiler %cmp_opt %f
func main(): Int64 {
    //var a:Float16 = 1.2
    if (! @) {  // EXPECTED: regex redundant operator
        return 1
    }
    return 0
}// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
