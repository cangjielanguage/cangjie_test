// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {
    var l_a : Array<(Unit*Unit)> = @{((),())}
    var r_a : Array<Int32> = @{1}
    l_a[0][0] = for (i in r_a) {true}  // EXPECTED: regex 'tuple element' can not be assigned
    if (l_a[0][0] == ()) {
        return 0
    }
    return 1
}
