// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {
    var l_a : Bool*Bool = (false,false)
    var r_a = 1
    var r_b = 1
    l_a[0] = r_a == r_b  // EXPECTED: regex 'tuple element' can not be assigned
    if (l_a[0] == true) {
        return 0
    }
    return 1
}
