// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
func main(): Bool { // EXPECTED: regex return type of entry function 'main' is not 'Integer' or 'Unit'
    if (return true) {
        return true
    }
    return false
}
// ASSERT: regex-not stack trace
// ASSERT: regex-not core dumped
