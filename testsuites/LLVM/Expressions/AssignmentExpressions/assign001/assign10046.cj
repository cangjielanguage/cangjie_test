// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace



func main(): Int64 {
    var l_a : Int32*Int32 = (4,4)
    var r_a : Int32 = 2
    var r_b : Int32 = 3
    l_a[0] = true?r_a:r_b  // EXPECTED: regex 'tuple element' can not be assigned
    if (l_a[0] == Int32(2)) {
        return 0
    }
    return 1
}
