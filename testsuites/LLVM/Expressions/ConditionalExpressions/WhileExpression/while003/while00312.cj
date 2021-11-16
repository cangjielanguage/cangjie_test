// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {
    while (true) {
        type int = Int32 // EXPECTED: regex type must be declared on toplevel
        return 0
    }
    return 1
}
