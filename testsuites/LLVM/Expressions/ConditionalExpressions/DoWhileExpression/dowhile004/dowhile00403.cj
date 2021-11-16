// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
func main(): Int64 {
    d o { EXPECTED: regex undeclared identifier 'd'
        return 0
    } while (true)
    return 1
}
