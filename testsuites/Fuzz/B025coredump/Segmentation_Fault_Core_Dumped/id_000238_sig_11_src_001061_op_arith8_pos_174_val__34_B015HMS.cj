// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


func main(): Int64 {
    var l_a : Array<(Unit*Unit)> = @{((),())}
    var r_a : Array<Int32> = @{1[
    l_a[0][0] = for i in r_a{true}
    if l_a[0][0] == () {
        return 0
    }
    return 1
}
