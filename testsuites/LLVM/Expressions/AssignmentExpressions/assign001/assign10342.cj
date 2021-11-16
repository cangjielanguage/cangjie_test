// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {
    var l_a : Bool*Bool = (false,false)
    var r_a = true
    var r_b = true
    l_a[0] = r_a && r_b  // EXPECTED: regex 'tuple element' can not be assigned
    if (l_a[0] == true) {
        return 0
    }
    return 1
}
