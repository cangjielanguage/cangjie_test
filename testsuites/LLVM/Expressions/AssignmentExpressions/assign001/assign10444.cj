// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {
    var l_a : Unit*Unit = ((),())
    var r_a : Int32 = 1
    l_a[0] = r_a++  // EXPECTED: regex 'tuple element' can not be assigned
    if (l_a[0] == ()) {
        return 0
    }
    return 1
}
