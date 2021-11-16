// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main(): Int64 {
    while (true) {
        [] // EXPECTED: regex error.*?empty list literal type cannot be inferred
        return 0
    }
    return 1
}
