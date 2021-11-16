// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
func main(): Int64 {
    DO { EXPECTED: regex undeclared identifier 'DO'
        return 0
    } while (true)
    return 1
}
