// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {
    var l_a : Array<Unit> = @{()}

    l_a[0] = return 0   // EXPECTED: regex expression of Nothing type cannot appear here currently
    if (l_a[0] == ()) {
        return 0
    }
    return 1
}
